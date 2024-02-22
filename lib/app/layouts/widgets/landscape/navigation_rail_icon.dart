import 'package:flutter/material.dart';

class AnikkiNavigationRailIcon extends StatelessWidget {
  const AnikkiNavigationRailIcon({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onPressed,
    this.error,
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

  /// If not null, will display a badge for error
  final String? error;

  /// Method to call when Icon is tapped
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 70,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TooltipVisibility(
              visible: error != null,
              child: Tooltip(
                message: error ?? '',
                child: Badge(
                  isLabelVisible: error != null,
                  child: Icon(
                    selected ? selectedIcon : icon,
                    size: 16,
                    color:
                        selected ? Theme.of(context).colorScheme.primary : null,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (title != null)
              Text(
                title!,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 9,
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
