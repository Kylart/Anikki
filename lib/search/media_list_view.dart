import 'package:anikki/helpers/capitalize.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/helpers/open_in_browser.dart';

class MediaListView extends StatelessWidget {
  const MediaListView({
    super.key,
    required this.data,
    required this.outline,
  });

  final List<Fragment$shortMedia> data;
  final Color outline;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: ListTile(
                title: Text('Animes'),
              ),
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return ListTile(
                    title: Text(item.title?.userPreferred ?? 'N/A'),
                    subtitle: item.format != null
                        ? Text(item.format!.name.capitalize())
                        : const Text(''),
                    onTap: () => openInBrowser(item.siteUrl),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.coverImage?.large ??
                          item.coverImage?.medium ??
                          ''),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
