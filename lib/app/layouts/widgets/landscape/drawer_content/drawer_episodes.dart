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
