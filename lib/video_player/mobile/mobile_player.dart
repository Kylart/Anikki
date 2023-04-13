import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import 'package:anikki/video_player/mobile/mobile_vlc_player_with_controls.dart';
import 'package:anikki/video_player/video_player.dart';

class MobilePlayer<T> implements VideoPlayer {
  MobilePlayer({required this.input}) {
    if (T == String) {
      videoPlayerController = VlcPlayerController.network(input as String);
    } else if (T == File) {
      videoPlayerController = VlcPlayerController.file(input as File);
    } else {
      throw 'Unhandled format for Mobile Player.';
    }
  }

  late VlcPlayerController videoPlayerController;
  final T input;

  Platform platform = Platform();

  void pause() {
    videoPlayerController.pause();
  }

  void play() {
    videoPlayerController.play();
  }

  void seek(Duration duration) {
    videoPlayerController.seekTo(duration);
  }

  void setRate(double rate) {}

  void setVolume(double value) {
    videoPlayerController.setVolume(value.toInt());
  }

  void togglePlay() {
    videoPlayerController.isPlaying().then((value) => value ?? false
        ? videoPlayerController.pause()
        : videoPlayerController.play());
  }

  @override
  Future<void> stop() async {
    await videoPlayerController.stopRendererScanning();
    await videoPlayerController.dispose();
  }

  @override
  Widget widget() {
    return MobileVlcPlayerWithControls(
      controller: videoPlayerController,
    );
  }
}
