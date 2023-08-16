import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Ionicons.close_outline),
    );
  }
}
