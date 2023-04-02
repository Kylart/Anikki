import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/news/bloc/news_bloc.dart';
import 'package:anikki/news/view/news_view.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.showOutline});

  final bool showOutline;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()
        ..add(
          NewsRequested(range: NewsBloc.initalDateRange),
        ),
      child: NewsView(
        showOutline: showOutline,
      ),
    );
  }
}
