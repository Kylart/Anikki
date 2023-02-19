import 'dart:io';
import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

import 'package:kawanime/components/shared/video_player/video_player.dart';

class DesktopPlayer<T> implements VideoPlayer {
  DesktopPlayer({required this.input}) {
    MediaSource source;

    if (T == String) {
      source = Media.network(input as String);
    } else if (T == File) {
      source = Media.file(input as File);
    } else {
      throw 'Unhandled format for Desktop Player.';
    }

    player.open(source);
  }

  final T input;

  final Player player = Player(id: Random().nextInt(100000));

  @override
  Platform platform = Platform();

  @override
  bool get isDesktop =>
      Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  @override
  Widget widget() {
    return Video(
      player: player,
      showControls: true,
    );
  }

  @override
  void pause() {
    player.pause();
  }

  @override
  void play() {
    player.play();
  }

  @override
  void seek(Duration duration) {
    player.seek(duration);
  }

  @override
  void setRate(double rate) {
    player.setRate(rate);
  }

  @override
  void setVolume(double value) {
    player.setVolume(value);
  }

  @override
  void stop() {
    player.stop();
  }

  @override
  void togglePlay() {
    player.playOrPause();
  }

  @override
  void show() {
    // TODO: implement show
  }
}
