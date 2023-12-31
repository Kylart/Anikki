import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/settings/widgets/sections/sections.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final anilistAuthBloc =
        BlocProvider.of<AnilistAuthBloc>(context, listen: true);

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final portrait = state is LayoutPortrait;

        return LayoutCard(
          transparent: portrait,
          child: Column(
            children: [
              if (!portrait)
                AppBar(
                  title: const Text('Settings'),
                ),
              Expanded(
                child: SettingsList(
                  sections: [
                    const GeneralSection(),
                    if (anilistAuthBloc.isConnected) const AnilistSection(),
                    const VideoPlayerSection(),
                    const StreamingSection(),
                    const TorrentSection(),
                    const DevelopperSection(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
