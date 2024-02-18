import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/home_continue/home_continue.dart';
import 'package:anikki/app/home_feed/view/home_feed_page.dart';
import 'package:anikki/app/home_more/view/home_more_page.dart';
import 'package:anikki/app/home_start/view/home_start_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        BlocProvider.of<AnilistAuthBloc>(context, listen: true).isConnected;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (context.landscape)
            const SizedBox(
              height: 150,
            ),
          if (isAuthenticated) const HomeContinuePage(),
          const HomeFeedPage(),
          if (isAuthenticated) const HomeStartPage(),
          const HomeMorePage(),
        ],
      ),
    );
  }
}
