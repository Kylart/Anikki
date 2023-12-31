import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart' as mk;

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/fade_overlay.dart';
import 'package:anikki/domain/domain.dart';
import 'package:anikki/app/video_player/view/video_player_view.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  Timer? _hideTimer;

  final VideoPlayerRepository repository;

  VideoPlayerBloc(this.repository)
      : super(
          const VideoPlayerState(),
        ) {
    on<VideoPlayerEvent>((event, emit) {
      if (event.runtimeType != VideoPlayerResetShowTimer) {
        logger.info('Video Player event: ${event.runtimeType}');
      }
    });

    on<VideoPlayerPlayRequested>((event, emit) {
      Navigator.of(event.context).push(
        FadeOverlay(
          child: VideoPlayerView(
            sources: event.sources,
            onVideoComplete: event.onVideoComplete,
            first: event.first,
          ),
        ),
      );
    });

    on<VideoPlayerDisplayTapped>((event, emit) {
      emit(state.copyWith(
        hideControls: !state.hideControls,
      ));

      if (!state.hideControls) restartShowTimer(emit);
    });

    on<VideoPlayerToggleFullscreen>((event, emit) {
      repository.handleFullscreen(state.fullscreen);

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
            displayTapped: false,
          ),
        );
      } else {
        restartShowTimer(emit);
        emit(
          state.copyWith(
            controlsHovered: false,
            displayTapped: false,
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
        seconds: 3,
      ),
      () {
        if (!state.controlsHovered && !isClosed) {
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
