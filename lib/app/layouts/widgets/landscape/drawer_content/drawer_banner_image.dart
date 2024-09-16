part of 'drawer_content.dart';

class DrawerBannerImage extends StatelessWidget {
  const DrawerBannerImage({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    final image = media.bannerImage ?? media.backgroundImage;

    if (image == null) return const SizedBox();

    return SizedBox(
      height: 255,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
