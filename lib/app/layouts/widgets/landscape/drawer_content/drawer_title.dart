part of 'drawer_content.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle({
    super.key,
    required this.media,
    required this.isConnected,
    this.libraryEntry,
  });

  final Media media;
  final LibraryEntry? libraryEntry;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        media.title ?? libraryEntry?.entries.first.title ?? 'N/A',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: media.anilistInfo.title?.native != null &&
              media.anilistInfo.title?.native != media.title
          ? AutoSizeText(
              media.anilistInfo.title!.native!,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      trailing: !isConnected
          ? null
          : FavouriteButton(
              media: media,
            ),
    );
  }
}
