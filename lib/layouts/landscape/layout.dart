import 'package:flutter/material.dart';

import 'package:anikki/layouts/landscape/custom_app_bar.dart';
import 'package:anikki/layouts/landscape/layout_card.dart';
import 'package:anikki/layouts/landscape/user_list.dart';
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
                  child: UserList(),
                ),
                SizedBox(
                  width: 12,
                ),
                Flexible(
                  flex: 1,
                  child: LayoutCard(
                    child: NewsPage(
                      showOutline: true,
                    ),
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
