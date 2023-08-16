part of 'media_dialog_episode.dart';

class MediaDialogEpisodeActions extends StatelessWidget {
  const MediaDialogEpisodeActions({
    super.key,
    required this.media,
    required this.index,
    required this.info,
    this.entry,
    this.localFile,
    this.mainAxisSize = MainAxisSize.max,
  });

  final Media media;
  final int index;
  final LibraryEntry? entry;
  final Fragment$shortMedia$streamingEpisodes? info;
  final MainAxisSize mainAxisSize;
  final LocalFile? localFile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: mainAxisSize,
      children: [
        if (localFile != null)
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => PlatformAlertDialog(
                  title:
                      Text('Do you really want to delete ${localFile!.path}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Nevermind'),
                    ),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<LibraryBloc>(context).add(
                          LibraryFileDeleteRequested(localFile!),
                        );

                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes!'),
                    ),
                  ],
                ),
              );
            },
            iconSize: 18.0,
            constraints: const BoxConstraints(),
            color: Colors.red,
            icon: const Icon(Icons.delete_forever_rounded),
          )
        else
          IconButton(
            onPressed: () {
              BlocProvider.of<DownloaderBloc>(context).add(
                DownloaderRequested(
                  media: media.anilistInfo,
                  episode: index,
                  entry: entry,
                ),
              );
            },
            iconSize: 18.0,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.file_download_outlined),
          ),
        if (info?.url != null && info?.site != null)
          Tooltip(
            message: 'See on ${info!.site}',
            child: IconButton(
              iconSize: 18.0,
              constraints: const BoxConstraints(),
              onPressed: () {
                openInBrowser(info?.url);
              },
              icon: const Icon(
                SimpleIcons.crunchyroll,
                color: Color(0xFFF47521),
              ),
            ),
          ),
      ],
    );
  }
}
