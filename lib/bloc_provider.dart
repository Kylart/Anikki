import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnikkiBlocProvider extends StatelessWidget {
  const AnikkiBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AnilistAuthBloc()..add(AnilistAuthLoginRequested()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: BlocProvider(
        create: (context) {
          final authBloc = BlocProvider.of<AnilistAuthBloc>(context);
          return WatchListBloc(authBloc);
        },
        child: child,
      ),
    );
  }
}
