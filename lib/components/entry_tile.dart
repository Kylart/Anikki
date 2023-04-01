import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:anikki/components/glass_circle.dart';
import 'package:anikki/helpers/show_entry_context_menu.dart';
import 'package:anikki/components/anikki_glass_icon.dart';
import 'package:anikki/components/entry_action.dart';

class EntryTile<T> extends StatelessWidget {
  const EntryTile({
    super.key,
    required this.entry,
    required this.subtitle,
    required this.actions,
    this.title,
    this.bannerImage,
    this.coverImage,
    this.tags,
  });

  final T entry;
  final Widget subtitle;
  final List<EntryAction> actions;
  final String? title;
  final String? bannerImage;
  final String? coverImage;
  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    String? episode;

    return GestureDetector(
      onTap: () {},
      onSecondaryTapUp: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: actions,
          title: title ?? '',
          episode: episode,
        );
      },
      onLongPressStart: (details) {
        showEntryContextMenu(
          offset: details.globalPosition,
          context: context,
          actions: actions,
          title: title ?? '',
          episode: episode,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: bannerImage != null
              ? DecorationImage(
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: NetworkImage(bannerImage!),
                )
              : const DecorationImage(
                  alignment: Alignment.topCenter,
                  opacity: 0.25,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/cover_placeholder.jpg'),
                ),
        ),
        child: ListTile(
          dense: true,
          isThreeLine: true,
          contentPadding: const EdgeInsets.all(4.0),
          title: Text(title ?? 'N/A'),
          leading: coverImage != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(coverImage!),
                )
              : const SizedBox(),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: subtitle,
              ),
              if (tags != null)
                Row(
                  children:
                      (tags!.length > 1 ? tags!.sublist(0, 2) : tags!).map(
                    (genre) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 10.0,
                                ),
                                child: Text(
                                  genre.toString(),
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
            ],
          ),
          trailing: actions.isEmpty
              ? const SizedBox()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Tooltip(
                        message: actions.first.label,
                        child: GlassCircle(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.all(4.0),
                              constraints: const BoxConstraints(),
                              onPressed: () => actions.first.callback(context),
                              icon: AnikkiIcon(icon: actions.first.icon),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GlassCircle(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(4.0),
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: GestureDetector(
                            onTapUp: (details) {
                              showEntryContextMenu(
                                offset: details.globalPosition,
                                context: context,
                                actions: actions,
                                title: title ?? '',
                                episode: episode,
                              );
                            },
                            child: const AnikkiIcon(icon: Icons.more_horiz),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
