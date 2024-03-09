import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/app/torrent/widgets/torrent_cannot_load.dart';
import 'package:anikki/app/torrent/widgets/torrent_tile.dart';
import 'package:anikki/core/widgets/error_widget.dart';

class TorrentView extends StatelessWidget {
  const TorrentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) => Column(
        children: [
          if (context.landscape) ...[
            Row(
              children: [
                SectionTitle(
                  text: settingsState.settings.torrentType.title,
                ),
              ],
            ),
            const Divider(
              height: 1,
            ),
          ],
          BlocBuilder<TorrentBloc, TorrentState>(
            builder: (context, state) => switch (state) {
              TorrentLoaded() => ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final torrent = state.torrents.elementAt(index);

                    return TorrentTile(torrent: torrent);
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                  itemCount: state.torrents.length,
                ),
              TorrentCannotLoad() => TorrentCannotLoadWidget(
                  type: settingsState.settings.torrentType,
                ),
              TorrentUnauthorized() => CustomErrorWidget(
                  title:
                      'Could not authenticate on ${settingsState.settings.torrentType.title}',
                  description:
                      'Are you sure you entered the right credentials? If yes, please close Anikki and restart it in a few minutes.',
                ),
              TorrentEmpty() || TorrentInitial() => const SizedBox(),
            },
          ),
        ],
      ),
    );
  }
}
