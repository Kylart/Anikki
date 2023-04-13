import 'dart:async';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/video_player/bloc/video_player_bloc.dart';
import 'package:anikki/helpers/desktop_hooks.dart';

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

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return PlayerCursorHandler(
          player: player,
          child: PlayerControlsBackground(
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
      },
    );
  }
}
