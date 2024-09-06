import 'dart:io';

import 'package:anikki/app/anilist_auth/widgets/token_input.dart';
import 'package:anikki/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_auth/widgets/connected_dialog.dart';
import 'package:anikki/domain/domain.dart';

final _oauthUrl = Uri(
  scheme: 'https',
  host: 'anilist.co',
  path: '/api/v2/oauth/authorize',
  queryParameters: {
    'client_id': dotenv.env['ANILIST_ID'],
    'response_type': 'token',
  },
);

final _oauthUrlLinux = Uri(
  scheme: 'https',
  host: 'anilist.co',
  path: '/api/v2/oauth/authorize',
  queryParameters: {
    'client_id': dotenv.env['ANILIST_ID_LINUX'],
    'response_type': 'token',
  },
);

Future<void> loginToAnilist(BuildContext context) async {
  final authBloc = BlocProvider.of<AnilistAuthBloc>(context);
  final box = await Hive.openBox(UserRepository.boxName);

  if (Platform.isLinux) {
    launchUrl(
      _oauthUrlLinux,
      mode: LaunchMode.externalApplication,
    );

    if (context.mounted) {
      await showDialog(
        barrierColor: context.colorScheme.surface.withOpacity(0.8),
        context: context,
        builder: (context) => const TokenInput(),
      );

      authBloc.add(AnilistAuthLoginRequested());
    }

    return;
  }

  box.watch(key: UserRepository.tokenKey).listen((event) {
    if (event.value == null || event.deleted) return;

    authBloc.add(AnilistAuthLoginRequested());

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => const ConnectedDialog(),
      );
    }
  });

  launchUrl(_oauthUrl, mode: LaunchMode.externalApplication);
}
