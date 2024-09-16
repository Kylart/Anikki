part of 'drawer_content.dart';

class DrawerLink extends StatelessWidget {
  const DrawerLink({
    super.key,
    required this.link,
    required this.media,
  });

  final DrawerAction link;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: const Icon(
        HugeIcons.strokeRoundedLinkSquare01,
        size: 12.0,
      ),
      backgroundColor: Colors.transparent,
      child: IconButton(
        tooltip: link.label,
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(12.0),
          ),
        ),
        onPressed: () => link.onPressed(context, media),
        icon: Icon(
          link.icon,
        ),
      ),
    );
  }
}
