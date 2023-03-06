import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/search/character_list_view.dart';
import 'package:anikki/components/search/media_list_view.dart';
import 'package:anikki/components/search/staff_list_view.dart';

class AnilistSearchView extends StatelessWidget {
  const AnilistSearchView({
    super.key,
    required this.entries,
    required this.outline,
  });

  final Map<AnilistSearchPart, List<Object>> entries;
  final Color outline;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entries.keys.map((part) {
        if (entries[part]!.isEmpty) return const SizedBox();

        switch (part) {
          case AnilistSearchPart.staffs:
            final List<Staff> data =
                entries[part]!.map((e) => e as Staff).toList();
            return StaffListView(data: data, outline: outline);

          case AnilistSearchPart.characters:
            final List<Character> data =
                entries[part]!.map((e) => e as Character).toList();
            return CharacterListView(data: data, outline: outline);

          case AnilistSearchPart.animes:
            final List<Media> data =
                entries[part]!.map((e) => e as Media).toList();
            return MediaListView(data: data, outline: outline);
        }
      }).toList(),
    );
  }
}
