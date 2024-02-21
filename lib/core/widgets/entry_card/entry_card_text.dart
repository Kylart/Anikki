part of 'entry_card.dart';

class _EntryCardText extends StatelessWidget {
  const _EntryCardText({required this.text});

  /// Text to display
  final String text;

  @override
  Widget build(BuildContext context) {
    return EntryTag(
      color: Colors.black54,
      outline: Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          color: darkTheme.textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
