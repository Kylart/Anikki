import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:protocol_handler/protocol_handler.dart';

import 'package:anikki/core/core.dart';

import 'package:anikki/features/layouts/presentation/view/layout_page.dart';
import 'package:anikki/features/anilist_auth/shared/mixins/anilist_auth_mixin.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';

import 'package:anikki/config/config.dart';

void main() async {
  /// Flutter hooks
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  Paint.enableDithering = true;

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
  Bloc.observer = const Observer();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: storageDirectory,
  );

  runApp(
    //// Providers are above [Anikki] instead of inside it, so that tests
    //// can use [Anikki] while mocking the providers
    const AnikkiBlocProvider(
      child: Anikki(),
    ),
  );
}

class Anikki extends StatefulWidget {
  const Anikki({
    super.key,
  });

  @override
  State<Anikki> createState() => _AnikkiState();
}

class _AnikkiState extends State<Anikki>
    with ProtocolListener, AnilistAuthMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anikki',

      /// This theme was made for FlexColorScheme version 6.1.1. Make sure
      /// you use same or higher version, but still same major version. If
      /// you use a lower version, some properties may not be supported. In
      /// that case you can also remove them after copying the theme to your app.
      theme: lightTheme,
      darkTheme: darkTheme,

      themeMode: BlocProvider.of<SettingsBloc>(context, listen: true)
          .state
          .settings
          .theme,
      home: Scaffold(
        body: SafeArea(
          /// This BlocBuilder is necessary to instanciate the [ConnectivityBloc]
          /// Otherwise it is instanciated on the first use.
          child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, _) {
              return const LayoutPage();
            },
          ),
        ),
      ),
    );
  }
}
