import 'dart:io';

import 'package:talker_flutter/talker_flutter.dart';

final logger = TalkerFlutter.init(
    settings: TalkerSettings(
        useConsoleLogs: !Platform.environment.containsKey('FLUTTER_TEST')));
