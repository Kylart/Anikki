import 'dart:io';

import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/models/settings_action.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.actions,
  });

  final List<SettingsAction> actions;

  static const icon = AnikkiGlassIcon(icon: Icons.settings);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return IconButton(
        icon: icon,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: actions
                        .map(
                          (e) => ListTile(
                            leading: Icon(e.icon),
                            title: Text(e.label),
                            onTap: () => e.callback(),
                            trailing: e.trailing,
                          ),
                        )
                        .toList(),
                  ),
                );
              });
        },
      );
    } else if (Platform.isIOS) {
      return IconButton(
        icon: icon,
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  actions: actions
                      .map((action) => CupertinoActionSheetAction(
                            child: Row(children: [
                              Icon(action.icon),
                              Text(action.label),
                              const Spacer(),
                              action.trailing,
                            ]),
                            onPressed: () => action.callback(),
                          ))
                      .toList(),
                );
              });
        },
      );
    } else {
      final currentTheme = Theme.of(context);

      return Theme(
        data: currentTheme.copyWith(
          colorScheme: ColorScheme.fromSwatch(
            brightness: currentTheme.brightness,
            cardColor: currentTheme.brightness == Brightness.dark
                ? Colors.black.withOpacity(0.95)
                : Colors.white.withOpacity(0.9),
          ),
        ),
        child: PopupMenuButton(
          tooltip: '',
          icon: icon,
          itemBuilder: (context) {
            return actions
                .map(
                  (e) => PopupMenuItem(
                    onTap: e.callback,
                    child: Row(
                      children: [
                        if (e.icon != null)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(e.icon),
                          ),
                        Text(e.label),
                        const Spacer(),
                        e.trailing,
                      ],
                    ),
                  ),
                )
                .toList();
          },
        ),
      );
    }
  }
}
