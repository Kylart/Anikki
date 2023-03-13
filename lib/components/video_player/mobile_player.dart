import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import 'package:anikki/components/video_player/mobile_vlc_player_with_controls.dart';
import 'package:anikki/components/video_player/video_player.dart';

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

  @override
  Platform platform = Platform();

  @override
  void pause() {
    videoPlayerController.pause();
  }

  @override
  void play() {
    videoPlayerController.play();
  }

  @override
  void seek(Duration duration) {
    videoPlayerController.seekTo(duration);
  }

  @override
  void setRate(double rate) {}

  @override
  void setVolume(double value) {
    videoPlayerController.setVolume(value.toInt());
  }

  @override
  Future<void> stop() async {
    await videoPlayerController.stopRendererScanning();
    await videoPlayerController.dispose();
  }

  @override
  void togglePlay() {
    videoPlayerController.isPlaying().then((value) => value ?? false
        ? videoPlayerController.pause()
        : videoPlayerController.play());
  }

  @override
  Widget widget() {
    return MobileVlcPlayerWithControls(
      controller: videoPlayerController,
    );
  }
}
