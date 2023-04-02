import 'dart:async';

import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:nyaa/nyaa.dart';

import 'package:anikki/helpers/anilist_client.dart';
import 'package:anikki/components/search/search_part.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? term;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final anilist = Anilist(client: getAnilistClient());

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();

              _debounce = Timer(const Duration(milliseconds: 500), () {
                setState(() => term = value.isEmpty ? null : value);
              });
            },
            autofocus: true,
          ),
          if (term != null && term!.isNotEmpty)
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.40,
              ),
              child: SearchPart(
                future: Nyaa().search(term!),
                title: const ListTile(
                  title: Text('Nyaa.si'),
                ),
              ),
            ),
          if (term != null && term!.isNotEmpty)
            SearchPart(
              future: anilist.search(term!),
              title: const ListTile(
                title: Text('Anilist.co'),
              ),
            ),
        ],
      ),
    );
  }
}
