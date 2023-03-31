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
            final List<Query$Search$staff$results> data = entries[part]!
                .map((e) => e as Query$Search$staff$results)
                .toList();
            return StaffListView(data: data, outline: outline);

          case AnilistSearchPart.characters:
            final List<Query$Search$characters$results> data = entries[part]!
                .map((e) => e as Query$Search$characters$results)
                .toList();
            return CharacterListView(data: data, outline: outline);

          case AnilistSearchPart.animes:
            final List<Fragment$shortMedia> data =
                entries[part]!.map((e) => e as Fragment$shortMedia).toList();
            return MediaListView(data: data, outline: outline);
        }
      }).toList(),
    );
  }
}
