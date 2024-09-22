part of 'drawer_content.dart';

class DrawerActionButton extends StatelessWidget {
  const DrawerActionButton({
    super.key,
    required this.action,
    required this.media,
  });

  final DrawerAction action;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: switch (action.type) {
        DrawerActionType.icon => IconButton(
            tooltip: action.label,
            iconSize: 26.0,
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(12.0),
              ),
            ),
            onPressed: () => action.onPressed(context),
            icon: Icon(
              action.icon,
            ),
          ),
        DrawerActionType.full => FilledButton.tonalIcon(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
              ),
            ),
            onPressed: () => action.onPressed(context),
            icon: Icon(
              action.icon,
              size: 32.0,
            ),
            label: Text(
              action.label,
              style: context.textTheme.bodyLarge,
            ),
          ),
      },
    );
  }
}
