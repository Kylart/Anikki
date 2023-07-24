import 'package:anikki/core/widgets/layout_card.dart';
import 'package:flutter/material.dart';

class ConnectedDialog extends StatelessWidget {
  const ConnectedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: LayoutCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Connected to Anilist!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
