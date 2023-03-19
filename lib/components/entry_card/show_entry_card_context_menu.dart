import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/components/entry_card/entry_card_action.dart';

void showEntryCardContextMenu({
  required Offset offset,
  required BuildContext context,
  required List<EntryCardAction> actions,
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
                .where((action) => action.type == EntryCardActionType.action)
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
                    (e) => e.type == EntryCardActionType.action
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
            (e) => (e.type == EntryCardActionType.action
                ? PopupMenuItem(
                    child: ListTile(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                        e.callback(context);
                      },
                      title: Opacity(opacity: 0.7, child: Text(e.label)),
                      leading: AnikkiGlassIcon(icon: e.icon),
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