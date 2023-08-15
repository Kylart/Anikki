import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home_feed/bloc/home_feed_bloc.dart';
import 'package:anikki/app/home_feed/view/home_feed_view.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final anilist = Anilist(client: getAnilistClient());
        final repository = FeedRepository(anilist);

        return HomeFeedBloc(repository)
          ..add(
            HomeFeedRefresh(),
          );
      },
      child: const HomeFeedView(),
    );
  }
}
