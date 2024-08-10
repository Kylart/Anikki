import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:anikki/domain/domain.dart';
import 'package:anikki/app/anilist_auth/widgets/connected_dialog.dart';
import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';

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
  final oauthUrl = Uri(
    scheme: 'https',
    host: 'anilist.co',
    path: '/api/v2/oauth/authorize',
    queryParameters: {
      'client_id': dotenv.env['ANILIST_ID'],
      'response_type': 'token',
    },
  );

  Future<void> login(BuildContext context) async {
    final authBloc = BlocProvider.of<AnilistAuthBloc>(context);
    final box = await Hive.openBox(UserRepository.boxName);

    box.watch(key: UserRepository.tokenKey).listen((event) {
      if (event.value == null || event.deleted) return;

      authBloc.add(AnilistAuthLoginRequested());

      if (mounted) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => const ConnectedDialog(),
        );
      }
    });

    launchUrl(oauthUrl, mode: LaunchMode.externalApplication);
  }

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
                onPressed: () => login(context),
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
                onPressed: () => login(context),
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
