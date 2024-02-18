import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/settings/widgets/sections/sections.dart';

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

        return Column(
          children: [
            if (!portrait) ...const [
              Row(
                children: [
                  SectionTitle(
                    backgroundColor: Colors.transparent,
                    text: 'Settings',
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
            ],
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
        );
      },
    );
  }
}
