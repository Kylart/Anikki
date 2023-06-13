import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/transmission/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/transmission/presentation/bloc/transmission_bloc.dart';
import 'package:anikki/features/transmission/presentation/view/transmission_view.dart';

class TransmissionPage extends StatelessWidget {
  const TransmissionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsBloc>(context)
        .state
        .settings
        .transmissionSettings;

    final transmission = TransmissionRepository(
      uri: Uri(
        host: settings.host,
        port: settings.port,
        scheme: settings.scheme,
        path: 'transmission/rpc',
      ),
      username: settings.username,
      password: settings.password,
    );

    return BlocProvider(
      create: (context) => TransmissionBloc(transmission),
      child: const TransmissionView(),
    );
  }
}
