import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';

import 'package:anikki/helpers/open_in_browser.dart';

class StaffListView extends StatelessWidget {
  const StaffListView({
    super.key,
    required this.data,
    required this.outline,
  });

  final List<Query$Search$staff$results> data;
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
                title: Text('Staff'),
              ),
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return ListTile(
                    title: Text(item.name?.full ?? 'N/A'),
                    subtitle: item.primaryOccupations != null &&
                            item.primaryOccupations!.isNotEmpty
                        ? Text(item.primaryOccupations!.first ?? '')
                        : const Text(''),
                    onTap: () => openInBrowser(item.siteUrl),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          item.image?.large ?? item.image?.medium ?? ''),
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
