import 'dart:io';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

import 'package:anikki/components/video_player/video_player.dart';
import 'package:anikki/components/video_player/player_widget.dart';
import 'package:anikki/components/video_player/player_controls/player_controls.dart';

class DesktopPlayer<T> implements VideoPlayer {
  /// Player instace
  final player = Player();

  /// Media to be open
  late final Media source;

  /// Input can be a String or a File instance.
  /// String can be used to open URLs and File for local files.
  final T input;

  DesktopPlayer({required this.input}) {
    if (T == String) {
      source = Media(input as String);
    } else if (T == File) {
      source = Media((input as File).path);
    } else {
      throw 'Unhandled format for Desktop Player.';
    }
  }

  @override
  Future<void> stop() async {}

  @override
  Widget widget() {
    return Stack(
      children: [
        Positioned.fill(
          child: PlayerWidget(
            player: player,
            source: source,
          ),
        ),
        Positioned.fill(
          child: PlayerControls(
            playerInstance: this,
          ),
        ),
      ],
    );
  }
}
