part of 'drawer_content.dart';

class DrawerDescription extends StatelessWidget {
  const DrawerDescription({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    if (media.anilistInfo.description == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: context.colorScheme.primary,
              width: 2.0,
            ),
          ),
        ),
        child: HtmlWidget(
          '<div style="text-align: justify">${media.anilistInfo.description!}</div>',
        ),
      ),
    );
  }
}
