part of 'drawer_content.dart';

class DrawerEpisodes extends StatelessWidget {
  const DrawerEpisodes({
    super.key,
    this.media,
    this.libraryEntry,
  });

  final Media? media;
  final LibraryEntry? libraryEntry;

  @override
  Widget build(BuildContext context) {
    final numberOfEpisodes = media?.anilistInfo.nextAiringEpisode?.episode ??
        media?.numberOfEpisodes ??
        libraryEntry?.entries.length;

    if (numberOfEpisodes == null) return const SizedBox();

    /// Listening to `LibraryBloc` so that content refreshes whenever library is updated.
    return BlocConsumer<LibraryBloc, LibraryState>(
      listener: (context, state) {
        if (state is LibraryEmpty && media?.anilistInfo.id == 0) {
          Scaffold.of(context).closeEndDrawer();
        }

        if (state is LibraryLoaded &&
            media?.anilistInfo.id == 0 &&
            libraryEntry?.entries.isEmpty == true) {
          Scaffold.of(context).closeEndDrawer();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
            vertical: _horizontalPadding / 4,
          ),
          child: Paginated(
            initialPage: 0,
            numberOfEntries: numberOfEpisodes,
            pageBuilder: (context, page) {
              return GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 450,
                  childAspectRatio: 32 / 9,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: (numberOfEpisodes - (page * kPaginatedPerPage))
                    .clamp(0, kPaginatedPerPage),
                itemBuilder: (context, realIndex) {
                  var episodeNumber =
                      numberOfEpisodes - realIndex - (page * kPaginatedPerPage);

                  if (episodeNumber < 1) return const SizedBox();

                  var localFile = libraryEntry?.entries.firstWhereOrNull(
                    (entry) => entry.episode == episodeNumber,
                  );

                  if (media == null && libraryEntry != null) {
                    localFile = libraryEntry?.entries.elementAt(realIndex);
                    episodeNumber = localFile?.episode ?? episodeNumber;
                  }

                  return DrawerEpisode(
                    localFile: localFile,
                    media: media,
                    episodeNumber: episodeNumber,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class DrawerEpisode extends StatelessWidget {
  const DrawerEpisode({
    super.key,
    required this.localFile,
    required this.media,
    required this.episodeNumber,
  });

  final LocalFile? localFile;
  final Media? media;
  final int episodeNumber;

  @override
  Widget build(BuildContext context) {
    final episodeTextStyle = context.textTheme.bodySmall;

    final info = media?.anilistInfo.streamingEpisodes?.firstWhereOrNull(
      (element) =>
          element?.title?.split(' - ').firstOrNull == 'Episode $episodeNumber',
    );

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      onTap: () {
        if (localFile != null) {
          VideoPlayerRepository.playFile(
            context: context,
            file: localFile,
            media: media,
          );
          return;
        }

        VideoPlayerRepository.playAnyway(
          context: context,
          media: media?.anilistInfo,
          episode: episodeNumber,
        );
      },
      onHover: (_) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Badge(
              alignment: const Alignment(0.5, -0.9),
              backgroundColor: Colors.transparent,
              label: media != null
                  ? DrawerEpisodeCompleted(
                      media: media!,
                      index: episodeNumber,
                    )
                  : null,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: (info?.thumbnail == null
                    ? const AssetImage('assets/images/cover_placeholder.jpg')
                    : CachedNetworkImageProvider(
                        info!.thumbnail!)) as ImageProvider,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: info?.title != null
                    ? AutoSizeText(
                        info!.title!,
                        maxLines: 3,
                        style: episodeTextStyle,
                      )
                    : Text(
                        'Episode $episodeNumber',
                        style: episodeTextStyle,
                      ),
              ),
            ),
            if (localFile != null)
              DrawerEpisodeDeleteButton(
                file: localFile!,
              )
          ],
        ),
      ),
    );
  }
}
