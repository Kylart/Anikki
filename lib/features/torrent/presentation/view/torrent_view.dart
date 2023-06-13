import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/qbittorrent/presentation/view/qbittorrent_page.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';
import 'package:anikki/features/transmission/presentation/view/transmission_page.dart';

class TorrentView extends StatefulWidget {
  const TorrentView({super.key});

  @override
  State<TorrentView> createState() => _TorrentViewState();
}

class _TorrentViewState extends State<TorrentView> {
  bool dismissed = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        switch (state.settings.torrentType) {
          case TorrentType.transmission:
            return const TransmissionPage();
          case TorrentType.qbittorrent:
            return const QBitTorrentPage();
          case TorrentType.none:
            return const SizedBox();
        }
      },
    );
  }
}
