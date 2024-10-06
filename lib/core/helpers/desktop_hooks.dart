import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

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
}

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
