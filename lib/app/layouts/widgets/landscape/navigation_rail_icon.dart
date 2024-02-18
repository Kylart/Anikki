import 'package:flutter/material.dart';

class AnikkiNavigationRailIcon extends StatelessWidget {
  const AnikkiNavigationRailIcon({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onPressed,
    this.title,
  });

  /// Icon displayed by default
  final IconData icon;

  /// Icon displayed when `selected` is set to `true`
  final IconData selectedIcon;

  /// If the icon is selected or not
  final bool selected;

  /// Text to display under the icon. If `null`, no text is displayed
  final String? title;

  /// Method to call when Icon is tapped
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              selected ? selectedIcon : icon,
              size: 24,
              color: selected ? Theme.of(context).colorScheme.primary : null,
            ),
            const SizedBox(
              height: 5,
            ),
            if (title != null)
              Text(
                title!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: selected
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
