import 'package:anikki/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hugeicons/hugeicons.dart';

class TokenInput extends StatelessWidget {
  const TokenInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: SizedBox(
        width: 200,
        height: 100,
        child: Center(
          child: FilledButton.icon(
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(24.0)),
            ),
            onPressed: () async {
              final token = await Clipboard.getData(Clipboard.kTextPlain);

              if (token == null ||
                  token.text == null ||
                  token.text?.startsWith('eyJ') != true) {
                return;
              }

              final box = await Hive.openBox(UserRepository.boxName);
              await box.put(UserRepository.tokenKey, token.text);

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            label: const Text('Paste Anilist token'),
            icon: const Icon(HugeIcons.strokeRoundedCopy02),
          ),
        ),
      ),
    );
  }
}
