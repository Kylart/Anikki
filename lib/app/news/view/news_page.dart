import 'package:flutter/material.dart';

import 'package:anikki/app/news/view/news_view.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.showOutline});

  final bool showOutline;

  @override
  Widget build(BuildContext context) {
    return NewsView(
      showOutline: showOutline,
    );
  }
}
