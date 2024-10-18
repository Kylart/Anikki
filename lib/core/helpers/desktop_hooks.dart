import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowsHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> setUpDesktop() async {
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    title: 'Anikki',
    backgroundColor: Colors.transparent,
    titleBarStyle:
        Platform.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
    minimumSize: const Size(0, 550),
    size: const Size(1400, 900),
    center: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  if (Platform.isWindows) {
    HttpOverrides.global = WindowsHttpOverrides();
  }
}

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
