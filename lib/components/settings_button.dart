import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/models/settings_action.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.actions,
  });

  final List<SettingsAction> actions;

  static const icon = Icon(Icons.settings);

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
        icon: const Icon(CupertinoIcons.settings),
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
      return PopupMenuButton(
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
      );
    }
  }
}
