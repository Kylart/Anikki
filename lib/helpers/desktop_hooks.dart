import 'dart:io';

import 'package:flutter_acrylic/flutter_acrylic.dart';

Future<void> setUpDesktop() async {
  await Window.initialize();
}

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
