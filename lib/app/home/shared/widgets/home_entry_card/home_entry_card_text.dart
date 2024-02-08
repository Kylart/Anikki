part of 'home_entry_card.dart';

class _HomeEntryCardText extends StatelessWidget {
  const _HomeEntryCardText({required this.text});

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
