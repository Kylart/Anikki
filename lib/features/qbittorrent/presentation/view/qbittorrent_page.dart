import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/qbittorrent/domain/domain.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/qbittorrent/presentation/bloc/qbittorrent_bloc.dart';
import 'package:anikki/features/qbittorrent/presentation/view/qbittorrent_view.dart';

class QBitTorrentPage extends StatelessWidget {
  const QBitTorrentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsBloc>(context)
        .state
        .settings
        .qBitTorrentSettings;

    final qBitTorrent = QBitTorrentRepository(
      uri: Uri(
        host: settings.host,
        port: settings.port,
        scheme: settings.scheme,
      ),
      username: settings.username,
      password: settings.password,
    );

    return BlocProvider(
      create: (context) => QBitTorrentBloc(qBitTorrent),
      child: const QBitTorrentView(),
    );
  }
}
