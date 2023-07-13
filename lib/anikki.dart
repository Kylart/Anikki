import 'package:anikki/bloc_listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocol_handler/protocol_handler.dart';

import 'package:anikki/config/config.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/features/anilist_auth/shared/mixins/anilist_auth_mixin.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/layouts/presentation/view/layout_page.dart';

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
              return const BlocListeners(
                child: LayoutPage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
