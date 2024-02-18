import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/search/search.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EntryTag(
      padding: EdgeInsets.zero,
      outline: Colors.transparent,
      child: IconButton(
        icon: const Icon(Ionicons.search),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                alignment: Alignment.topCenter,
                child: SearchView(),
              );
            },
          );
        },
      ),
    );
  }
}
