import 'dart:io';
import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:anikki/components/shared/video_player/desktop_player_controls.dart';

import 'package:anikki/components/shared/video_player/video_player.dart';

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
  Widget widget() {
    final controls = DesktopPlayerControls(
      player: this,
    );

    final video = Video(
      player: player,
      showControls: false,
    );

    return Stack(
      children: [
        Positioned.fill(child: video),
        Positioned.fill(
          child: controls,
        ),
      ],
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

  void forward(Duration time) {
    final Duration? duration = player.position.position;

    if (duration == null) return;

    player.seek(duration + time);
  }

  void rewind(Duration time) {
    final Duration? duration = player.position.position;

    if (duration == null) return;

    player.seek(duration - time);
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
  Future<void> stop() async {
    player.stop();
  }

  @override
  void togglePlay() {
    player.playOrPause();
  }
}
