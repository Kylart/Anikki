import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/widgets/anikki_icon.dart';
import 'package:anikki/models/anikki_action.dart';

class AnikkiActionButton extends StatelessWidget {
  const AnikkiActionButton({
    super.key,
    required this.actions,
    this.icon = const AnikkiIcon(icon: Icons.settings),
  });

  final List<AnikkiAction> actions;
  final Widget icon;

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
                          (e) => e.type == AnikkiActionType.action
                              ? ListTile(
                                  leading: Icon(e.icon),
                                  title: Text(e.label),
                                  onTap: () => e.callback(context),
                                  trailing: e.trailing,
                                )
                              : const Divider(),
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
                      .map(
                        (action) => action.type == AnikkiActionType.action
                            ? CupertinoActionSheetAction(
                                child: Row(
                                  children: [
                                    AnikkiIcon(icon: action.icon),
                                    const Spacer(),
                                    Text(action.label),
                                    const Spacer(),
                                    if (action.trailing != null)
                                      action.trailing!,
                                  ],
                                ),
                                onPressed: () => action.callback(context),
                              )
                            : const Divider(
                                height: 1,
                              ),
                      )
                      .toList(),
                );
              });
        },
      );
    } else {
      return SizedBox(
        width: 35,
        height: 35,
        child: PopupMenuButton(
          tooltip: '',
          icon: icon,
          padding: EdgeInsets.zero,
          itemBuilder: (context) {
            return actions
                .map(
                  (e) => (e.type == AnikkiActionType.action
                      ? PopupMenuItem(
                          onTap: () => e.callback(context),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                              e.callback(context);
                            },
                            dense: true,
                            leading: AnikkiIcon(icon: e.icon),
                            title: Text(e.label),
                            trailing: e.trailing,
                          ),
                        )
                      : const PopupMenuDivider()) as PopupMenuEntry,
                )
                .toList();
          },
        ),
      );
    }
  }
}
