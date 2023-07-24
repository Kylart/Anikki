import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:window_manager/window_manager.dart';

import 'package:anikki/anikki.dart';
import 'package:anikki/domain/domain.dart';
import 'package:anikki/core/helpers/desktop_hooks.dart';

mixin AnilistAuthMixin on State<Anikki>, ProtocolListener {
  final availableHosts = [
    'anilist-auth',
  ];

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
  void onProtocolUrlReceived(String url) async {
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

    final box = await Hive.openBox(UserRepository.boxName);
    await box.put(UserRepository.tokenKey, token);

    if (isDesktop()) {
      windowManager.focus();
    }
  }
}
