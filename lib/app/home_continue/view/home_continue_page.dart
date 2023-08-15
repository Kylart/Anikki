import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home_continue/bloc/home_continue_bloc.dart';
import 'package:anikki/app/home_continue/view/home_continue_view.dart';

class HomeContinuePage extends StatelessWidget {
  const HomeContinuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final anilist = Anilist(client: getAnilistClient());
        final repository = UserListRepository(anilist);

        return HomeContinueBloc(repository);
      },
      child: const HomeContinueView(),
    );
  }
}
