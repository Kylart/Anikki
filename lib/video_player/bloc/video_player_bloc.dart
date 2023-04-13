import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:media_kit/media_kit.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final Player player;

  Timer? _hideTimer;

  VideoPlayerBloc(this.player)
      : super(
          const VideoPlayerState(),
        ) {
    on<VideoPlayerDisplayTapped>((event, emit) {
      if (player.state.playing) {
        if (state.displayTapped) {
          emit(
            state.copyWith(
              hideControls: true,
              displayTapped: false,
            ),
          );
        } else {
          restartShowTimer(emit);
        }
      } else {
        emit(
          state.copyWith(
            hideControls: true,
          ),
        );
      }
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
      const Duration(seconds: 3),
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
        displayTapped: true,
      ),
    );
  }
}
