import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:protocol_handler/protocol_handler.dart';

import 'package:anikki/anikki.dart';
import 'package:anikki/core/core.dart';

void main() async {
  /// Flutter hooks
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  final storageDirectory =
      kDebugMode || Platform.environment.containsKey('FLUTTER_TEST')
          ? await getTemporaryDirectory()
          : await getApplicationDocumentsDirectory();

  await Future.wait([
    /// Storage
    Hive.initFlutter(storageDirectory.path),

    /// Desktop hooks
    if (isDesktop()) setUpDesktop(),

    /// Register a custom protocol
    protocolHandler.register('anikki'),

    /// Register env variables
    dotenv.load(),
  ]);

  /// Bloc init hooks
  Bloc.observer = observer;
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: storageDirectory,
  );

  runApp(
    DevicePreview(
      enabled: Platform.environment['DEVICE_PREVIEW'] == 'on',
      //// Providers are above [Anikki] instead of inside it, so that tests
      //// can use [Anikki] while mocking the providers
      builder: (context) => const AnikkiBlocProvider(
        child: Anikki(),
      ),
    ),
  );
}
