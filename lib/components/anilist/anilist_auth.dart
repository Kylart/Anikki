import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:anikki/components/anilist/anilist_menu.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/user_preferences/anilist_token.dart';

mixin AnilistAuth on State<AnilistMenu>, ProtocolListener {
  final availableHosts = [
    'anilist-auth',
  ];

  final oauthUrl = Uri(
    scheme: 'https',
    host: 'anilist.co',
    path: '/api/v2/oauth/authorize',
    queryParameters: {
      'client_id': dotenv.env['ANILIST_ID'],
      'response_type': 'token',
    },
  );

  String? accessToken;

  @override
  void initState() {
    protocolHandler.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    protocolHandler.removeListener(this);
    super.dispose();
  }

  @override
  void onProtocolUrlReceived(String url) {
    final uri = Uri.parse(url.replaceFirst('#', '?'));

    /**
     * On `anikki://anilist-auth?blabla=hello`
     * 
     * final scheme = uri.scheme; // anikki
     * final host = uri.host; // anilist-auth
     * final query = uri.query; // blabla=hello
     * final params = uri.queryParameters; // {blabla: hello}
     */

    if (!availableHosts.contains(uri.host)) return;

    final token = uri.queryParameters['access_token'];

    if (token == null) return;

    setState(() {
      accessToken = token;
    });
  }

  Future<void> showConnectionDialog(
      BuildContext context, bool connected) async {
    await showDialog(
      context: context,
      builder: (context) {
        if (connected) {
          return AlertDialog(
            title: const Text('Connected to Anilist'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: const Text('Connecting to Anilist'),
            content: const Text(
                'Please press Next once you have authorized Anikki on Anilsit'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Next'),
              ),
            ],
          );
        }
      },
    );
  }

  Future<void> login(BuildContext context) async {
    final anilistStore = context.read<AnilistStore>();
    final prefsStore = context.read<AnilistToken>();

    launchUrl(oauthUrl);
    await showConnectionDialog(context, false);

    if (accessToken == null) return;

    anilistStore.setupClient(accessToken);

    prefsStore.token = accessToken;

    if (mounted) await showConnectionDialog(context, true);
  }

  Future<void> logout(BuildContext context) async {
    context.read<AnilistStore>().logout();
    setState(() {
      accessToken = null;
    });
  }
}
