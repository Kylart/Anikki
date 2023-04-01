import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/anilist_auth/view/anilist_auth_view.dart';

class AnilistAuthPage extends StatelessWidget {
  const AnilistAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnilistAuthBloc()..add(AnilistAuthLoginRequested()),
      child: const AnilistAuthView(),
    );
  }
}
