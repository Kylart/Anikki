import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';
import 'package:anikki/features/library/domain/models/library_entry.dart';
import 'package:anikki/features/entry_card_overlay/presentation/widgets/entry_card_overlay_actions.dart';

class EntryCardModal extends StatelessWidget {
  const EntryCardModal({
    super.key,
    required this.media,
    this.libraryEntry,
  });

  /// [Fragment$shortMedia] this entry card is about
  final Fragment$shortMedia media;

  /// [LibraryEntry] for this card if any
  final LibraryEntry? libraryEntry;

  String get title =>
      media.title?.userPreferred ?? libraryEntry?.entries.first.title ?? 'N/A';

  String? get coverImage =>
      media.coverImage?.extraLarge ??
      media.coverImage?.large ??
      media.coverImage?.medium;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: ListView(
          children: [
            if (coverImage != null)
              Image.network(
                coverImage!,
                fit: BoxFit.fill,
              ),
            ListTile(
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              subtitle: media.title?.native != null
                  ? Text(
                      media.title!.native!,
                      textAlign: TextAlign.center,
                    )
                  : null,
            ),
            if (media.genres != null && media.genres!.isNotEmpty)
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 4.0,
                spacing: 4.0,
                children: [
                  ...media.genres!.map(
                    (genre) {
                      return EntryTag(
                        child: Text(
                          genre.toString(),
                          // style: const TextStyle(fontSize: 10.0),
                        ),
                      );
                    },
                  ).toList(),
                  if (media.source != null)
                    EntryTag(
                      child: Text(
                        media.source!.name.capitalize().replaceAll('_', ' '),
                      ),
                    ),
                  if (media.studios != null && media.studios!.nodes!.isNotEmpty)
                    EntryTag(
                      child: Text(
                        'Studio: ${media.studios!.nodes!.first!.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EntryCardOverlayActions(
                entry: libraryEntry,
                media: Media(anilistInfo: media),
              ),
            ),
            const ListTile(
              title: Text('Episodes'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
