import 'dart:io';

import 'package:flutter_acrylic/flutter_acrylic.dart';

Future<void> setUpDesktop() async {
  await Window.initialize();

  if (Platform.isMacOS) {
    Window.makeTitlebarTransparent();
    Window.hideTitle();
    Window.enableFullSizeContentView();
  }
}

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
