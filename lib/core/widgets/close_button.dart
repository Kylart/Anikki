import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

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
      icon: const Icon(HugeIcons.strokeRoundedCancel01),
    );
  }
}
