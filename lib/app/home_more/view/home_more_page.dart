import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home_more/bloc/home_more_bloc.dart';
import 'package:anikki/app/home_more/view/home_more_view.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

class HomeMorePage extends StatelessWidget {
  const HomeMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final anilist = Anilist(client: getAnilistClient());
        final repository = FeedRepository(anilist);

        return HomeMoreBloc(repository)
          ..add(
            HomeMoreRefresh(),
          );
      },
      child: const HomeMoreView(),
    );
  }
}
