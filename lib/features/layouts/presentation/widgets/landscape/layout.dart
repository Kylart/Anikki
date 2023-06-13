import 'package:flutter/material.dart';

import 'package:anikki/features/torrent/torrent.dart';
import 'package:anikki/features/layouts/presentation/widgets/landscape/custom_app_bar.dart';
import 'package:anikki/features/layouts/presentation/widgets/landscape/layout_card.dart';
import 'package:anikki/features/user_list/presentation/view/user_list_view.dart';
import 'package:anikki/features/news/news.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({
    Key? key,
  }) : super(key: key);

  final borderRadius = const BorderRadius.all(Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: UserListView(),
                ),
                SizedBox(
                  width: 12,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: LayoutCard(
                          child: NewsPage(
                            showOutline: true,
                          ),
                        ),
                      ),
                      TorrentView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
