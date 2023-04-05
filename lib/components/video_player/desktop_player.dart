import 'dart:io';

import 'package:anikki/components/video_player/desktop_player_controls.dart';
import 'package:flutter/material.dart';

import 'package:anikki/components/video_player/video_player.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class DesktopPlayer<T> implements VideoPlayer {
  final player = Player();
  late final Media source;
  final T input;

  DesktopPlayer({required this.input}) {
    final player = Player();

    if (T == String) {
      source = Media(input as String);
    } else if (T == File) {
      source = Media((input as File).path);
    } else {
      throw 'Unhandled format for Desktop Player.';
    }
  }

  void pause() {
    player.pause();
  }

  void play() {
    player.play();
  }

  void seek(Duration duration) {
    player.seek(duration);
  }

  void forward(Duration time) {
    final Duration duration = player.state.position;

    player.seek(duration + time);
  }

  void rewind(Duration time) {
    final Duration duration = player.state.position;

    player.seek(duration - time);
  }

  void setRate(double rate) {
    player.setRate(rate);
  }

  void setVolume(double value) {
    player.setVolume(value);
  }

  void togglePlay() {
    player.playOrPause();
  }

  @override
  Future<void> stop() async {
    player.dispose();
  }

  @override
  Widget widget() {
    final controls = DesktopPlayerControls(
      playerInstance: this,
    );

    final video = MobilePlayerWidget(
      player: player,
      source: source,
    );

    return Stack(
      children: [
        Positioned.fill(
          child: video,
        ),
        Positioned.fill(
          child: controls,
        ),
      ],
    );
  }
}

class MobilePlayerWidget extends StatefulWidget {
  const MobilePlayerWidget(
      {super.key, required this.player, required this.source});

  final Player player;
  final Media source;

  @override
  State<MobilePlayerWidget> createState() => _MobilePlayerWidgetState();
}

class _MobilePlayerWidgetState extends State<MobilePlayerWidget> {
  // Reference to the [VideoController] instance from `package:media_kit_video`.
  VideoController? controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // Create a [VideoController] instance from `package:media_kit_video`.
      // Pass the [handle] of the [Player] from `package:media_kit` to the [VideoController] constructor.
      controller = await VideoController.create(
        widget.player.handle,
      );
      // Must be created before opening any media. Otherwise, a separate window will be created.
      setState(() {});

      await widget.player.open(widget.source);
      await widget.player.play();
    });
  }

  @override
  void dispose() {
    Future.microtask(() async {
      // Release allocated resources back to the system.
      await controller?.dispose();
      await widget.player.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(
      /// Pass the [controller] to display the video output.
      controller: controller,
    );
  }
}
