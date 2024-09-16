part of 'drawer_content.dart';

class DrawerEpisodes extends StatelessWidget {
  const DrawerEpisodes({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    final numberOfEpisodes =
        media.anilistInfo.nextAiringEpisode?.episode ?? media.numberOfEpisodes;

    if (numberOfEpisodes == null) return const SizedBox();

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
            itemBuilder: (context, index) {
              final episodeNumber =
                  numberOfEpisodes - index - (page * kPaginatedPerPage);

              if (episodeNumber < 1) return const SizedBox();

              final info =
                  media.anilistInfo.streamingEpisodes?.firstWhereOrNull(
                (element) =>
                    element?.title?.split(' - ').firstOrNull ==
                    'Episode $episodeNumber',
              );

              return InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                onTap: () {
                  VideoPlayerRepository.playAnyway(
                    context: context,
                    media: media.anilistInfo,
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
                        label: DrawerEpisodeCompleted(
                          media: media,
                          index: episodeNumber,
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: (info?.thumbnail == null
                              ? const AssetImage(
                                  'assets/images/cover_placeholder.jpg')
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
                                )
                              : Text('Episode $episodeNumber'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
