import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:window_manager/window_manager.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/video_player/presentation/bloc/video_player_bloc.dart';

part 'player_controls_background.dart';
part 'player_movable_controls.dart';
part 'player_non_movable_controls.dart';
part 'player_cursor_handler.dart';
part 'player_controls_stop.dart';
part 'player_controls_volume.dart';
part 'player_controls_progress.dart';
part 'player_controls_fullscreen.dart';
part 'player_controls_playback.dart';
part 'player_controls_play_pause.dart';
part 'player_controls_subtitles.dart';
part 'player_controls_audios.dart';
part 'player_controls_shortcuts.dart';
part 'intents.dart';
part 'actions.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return PlayerControlsShortcuts(
      player: player,
      child: PlayerCursorHandler(
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
                  if (!isSmallScreen) PlayerControlsVolume(player: player),
                  PlayerControlsPlayback(
                    player: player,
                    dense: isSmallScreen,
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
      ),
    );
  }
}

class PlayerControlsReduced extends StatelessWidget {
  const PlayerControlsReduced({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return PlayerCursorHandler(
      player: player,
      child: PlayerControlsBackground(
        nonMovable: true,
        child: Row(
          children: [
            PlayerControlsPlayPause(
              player: player,
              dense: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: PlayerControlsProgress(player: player),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
