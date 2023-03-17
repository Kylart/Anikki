import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

Future<void> setUpDesktop() async {
  await Window.initialize();

  if (Platform.isWindows || Platform.isLinux) {
    DartVLC.initialize();
  }

  if (Platform.isMacOS) {
    Window.makeTitlebarTransparent();
    Window.enableFullSizeContentView();
  }
}

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
