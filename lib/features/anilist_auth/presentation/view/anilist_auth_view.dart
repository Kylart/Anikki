import 'package:anikki/core/widgets/layout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';

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
    final box = await Hive.openBox(AnilistAuthBloc.boxName);

    box.watch(key: AnilistAuthBloc.tokenKey).listen((event) {
      if (event.value == null || event.deleted) return;

      authBloc.add(AnilistAuthLoginRequested());

      if (mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              child: LayoutCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Connected to Anilist!',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    });

    launchUrl(oauthUrl, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case AnilistAuthLoggedOut:
            return Column(
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
            );
          case AnilistAuthError:
            return Column(
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
            );

          case AnilistAuthSuccess:
          default:
            return const SizedBox();
        }
      },
    );
  }
}
