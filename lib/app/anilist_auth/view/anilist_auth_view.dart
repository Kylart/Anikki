import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_auth/shared/helpers/login.dart';

enum AnilistMenuItem {
  auth,
  logout,
}

class AnilistAuthView extends StatefulWidget {
  const AnilistAuthView({super.key});

  @override
  State<AnilistAuthView> createState() => _AnilistAuthViewState();
}

class _AnilistAuthViewState extends State<AnilistAuthView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, state) => switch (state) {
        AnilistAuthLoggedOut() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You are not logged into Anilist.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => loginToAnilist(context),
                label: const Text('Log In'),
                icon: const Icon(SimpleIcons.anilist),
              ),
            ],
          ),
        AnilistAuthError() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Could not log you into Anilist',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => loginToAnilist(context),
                label: const Text('Retry'),
                icon: const Icon(SimpleIcons.anilist),
              ),
            ],
          ),
        _ => const SizedBox(),
      },
    );
  }
}
