part of 'drawer_content.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle({
    super.key,
    required this.isConnected,
    this.media,
    this.libraryEntry,
    this.isInWatchList = false,
  });

  final Media? media;
  final LibraryEntry? libraryEntry;
  final bool isConnected;
  final bool isInWatchList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        media?.title ?? libraryEntry?.entries.first.title ?? 'N/A',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: (media?.anilistInfo.title?.native != null &&
                  media?.anilistInfo.title?.native != media?.title) ||
              libraryEntry != null
          ? AutoSizeText(
              media?.anilistInfo.title?.native ??
                  dirname(libraryEntry!.entries.first.path),
              overflow: TextOverflow.ellipsis,
            )
          : null,
      trailing: media != null && isConnected && isInWatchList
          ? FavouriteButton(
              media: media!,
            )
          : null,
    );
  }
}
