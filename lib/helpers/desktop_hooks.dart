import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> setUpDesktop() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(300, 400),
    size: Size(1200, 720),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
