import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/components/entry_action.dart';

void showEntryCardContextMenu({
  required Offset offset,
  required BuildContext context,
  required List<EntryAction> actions,
  required String title,
  String? episode,
}) {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text(
              title + (episode != null ? ' - Episode $episode' : ''),
            ),
            actions: actions
                .where((action) => action.type == EntryActionType.action)
                .map((action) => CupertinoActionSheetAction(
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(action.label),
                          const Spacer(),
                          Icon(action.icon),
                        ],
                      ),
                      onPressed: () => action.callback(context),
                    ))
                .toList(),
          );
        });
  } else if (Platform.isAndroid) {
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
                    (e) => e.type == EntryActionType.action
                        ? ListTile(
                            leading: Icon(e.icon),
                            title: Text(e.label),
                            onTap: () => e.callback(context),
                          )
                        : const Divider(
                            height: 1,
                          ),
                  )
                  .toList(),
            ),
          );
        });
  } else {
    showMenu(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        MediaQuery.of(context).size.width - offset.dx,
        0,
      ),
      items: actions
          .map<PopupMenuEntry>(
            (e) => (e.type == EntryActionType.action
                ? PopupMenuItem(
                    child: ListTile(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                        e.callback(context);
                      },
                      title: Text(e.label),
                      leading: AnikkiIcon(icon: e.icon),
                    ),
                  )
                : const PopupMenuDivider(
                    height: 1,
                  )) as PopupMenuEntry,
          )
          .toList(),
    );
  }
}
