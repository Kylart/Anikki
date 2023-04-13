import 'dart:async';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/components/video_player/desktop_player.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/components/video_player/player_controls/controls_mixin.dart';

part 'player_controls_background.dart';
part 'player_movable_controls.dart';
part 'player_non_movable_controls.dart';
part 'player_cursor_handler.dart';
part 'player_controls_stop.dart';
part 'player_controls_volume.dart';
part 'player_controls_progress.dart';
part 'player_controls_fullscreen.dart';
part 'player_controls_playback.dart';
part 'player_controls_subtitles.dart';
part 'player_controls_audios.dart';

class PlayerControls extends StatefulWidget {
  const PlayerControls({super.key, required this.playerInstance});

  final DesktopPlayer playerInstance;
  Player get player => playerInstance.player;

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls>
    with SingleTickerProviderStateMixin, ControlsMixin {
  DesktopPlayer get playerInstance => widget.playerInstance;
  Player get player => widget.player;

  @override
  Widget build(BuildContext context) {
    return PlayerCursorHandler(
      hideControls: hideControls,
      onHover: () => cancelAndRestartTimer(),
      onTapped: () {
        if (widget.player.state.playing) {
          if (displayTapped) {
            setState(() {
              hideControls = true;
              displayTapped = false;
            });
          } else {
            cancelAndRestartTimer();
          }
        } else {
          setState(() => hideControls = true);
        }
      },
      player: player,
      child: PlayerControlsBackground(
        onEnter: () => setState(() {
          hideControls = false;
          controlsHovered = true;
        }),
        onExit: () => setState(() {
          controlsHovered = false;
        }),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PlayerControlsProgress(player: player),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerControlsVolume(player: player),
                PlayerControlsPlayback(
                  player: player,
                  playerInstance: playerInstance,
                ),
                Row(
                  children: [
                    PlayerControlsSubtitles(player: player),
                    PlayerControlsAudios(player: player),
                    PlayerControlsStop(player: player),
                    const PlayerControlsFullscreen(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
