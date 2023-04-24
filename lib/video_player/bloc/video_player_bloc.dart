import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/helpers/logger.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final Player player;

  Timer? _hideTimer;

  VideoPlayerBloc(this.player)
      : super(
          const VideoPlayerState(),
        ) {
    on<VideoPlayerEvent>((event, emit) {
      logger.v('Video Player event: ${event.runtimeType}');
    });

    on<VideoPlayerDisplayTapped>((event, emit) {
      emit(state.copyWith(
        hideControls: !state.hideControls,
      ));

      if (!state.hideControls) restartShowTimer(emit);
    });

    on<VideoPlayerToggleFullscreen>((event, emit) {
      if (state.fullscreen) {
        if (isDesktop()) {
          windowManager.setFullScreen(false);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
            DeviceOrientation.portraitDown,
          ]);
        }
      } else {
        if (isDesktop()) {
          windowManager.setFullScreen(true);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        }
      }

      emit(
        state.copyWith(
          fullscreen: !state.fullscreen,
        ),
      );
    });

    on<VideoPlayerControlsHovered>((event, emit) {
      if (event.isHovered) {
        emit(
          state.copyWith(
            controlsHovered: true,
          ),
        );
      } else {
        restartShowTimer(emit);
        emit(
          state.copyWith(
            controlsHovered: false,
          ),
        );
      }
    });

    on<VideoPlayerResetShowTimer>((event, emit) {
      restartShowTimer(emit);
    });

    on<VideoPlayerStateUpdated>((event, emit) {
      emit(event.state);
    });

    on<VideoPlayerInit>((event, emit) {
      startHideTimer(emit);
    });

    add(VideoPlayerInit());
  }

  void startHideTimer(Emitter<VideoPlayerState> emit) {
    _hideTimer = Timer(
      const Duration(
        seconds: 1,
        milliseconds: 500,
      ),
      () {
        if (!state.controlsHovered) {
          add(
            VideoPlayerStateUpdated(
              state.copyWith(
                hideControls: true,
                displayTapped: false,
              ),
            ),
          );
        }
      },
    );
  }

  void restartShowTimer(Emitter<VideoPlayerState> emit) {
    _hideTimer?.cancel();

    startHideTimer(emit);

    emit(
      state.copyWith(
        hideControls: false,
      ),
    );
  }
}
