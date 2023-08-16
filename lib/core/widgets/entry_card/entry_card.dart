import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/entry_card_overlay/shared/show.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry_card/entry_card_cover.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.media,
    required this.cover,
    this.libraryEntry,
  });

  /// [Media] this entry card is about
  final Media media;

  /// [LibraryEntry] for this card if any
  final LibraryEntry? libraryEntry;

  /// Cover to use for this card
  final EntryCardCover cover;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  String get title =>
      widget.media.title ?? widget.libraryEntry?.entries.first.title ?? 'N/A';

  String? get coverImage => widget.media.coverImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showMediaDialog(context, widget.media);
          },
          child: Column(
            children: [
              Expanded(child: widget.cover),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                title: Tooltip(
                  message: title,
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(
                      '$title\n',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
