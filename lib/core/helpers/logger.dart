import 'dart:io';

import 'package:talker_flutter/talker_flutter.dart';

final logger = Talker(
  settings: TalkerSettings(
    useConsoleLogs: !Platform.environment.containsKey('FLUTTER_TEST')
  )
);
