import 'dart:async';
import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:media_kit/media_kit.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:window_manager/window_manager.dart';

import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';
import 'package:anikki/core/core.dart' hide Media;
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/data/data.dart';

part 'actions.dart';
part 'intents.dart';
part 'player_controls_audios.dart';
part 'player_controls_background.dart';
part 'player_controls_brightness_bar.dart';
part 'player_controls_fullscreen.dart';
part 'player_controls_play_pause.dart';
part 'player_controls_playback.dart';
part 'player_controls_progress.dart';
part 'player_controls_shortcuts.dart';
part 'player_controls_stop.dart';
part 'player_controls_subtitles.dart';
part 'player_controls_title.dart';
part 'player_controls_volume.dart';
part 'player_controls_volume_bar.dart';
part 'player_cursor_handler.dart';
part 'player_movable_controls.dart';
part 'player_non_movable_controls.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    super.key,
    required this.player,
    this.smallControls = false,
  });

  final Player player;
  final bool smallControls;

  @override
  Widget build(BuildContext context) {
    if (smallControls) return _PlayerControlsReduced(player: player);

    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return PlayerControlsShortcuts(
      player: player,
      child: PlayerCursorHandler(
        player: player,
        child: PlayerControlsBackground(
          child: Column(
            children: [
              PlayerControlsTitle(player: player),
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

class _PlayerControlsReduced extends StatelessWidget {
  const _PlayerControlsReduced({
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
