import 'dart:async';

import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:anikki/components/video_player/controls_mixin.dart';
import 'package:anikki/components/video_player/desktop_player.dart';
import 'package:media_kit/media_kit.dart';

// Inspired by https://github.com/alexmercerind/dart_vlc/blob/master/lib/src/widgets/controls.dart
class DesktopPlayerControls extends StatefulWidget {
  const DesktopPlayerControls({super.key, required this.playerInstance});

  final DesktopPlayer playerInstance;
  Player get player => playerInstance.player;

  @override
  State<DesktopPlayerControls> createState() => _DesktopPlayerControlsState();
}

class _DesktopPlayerControlsState extends State<DesktopPlayerControls>
    with SingleTickerProviderStateMixin, ControlsMixin {
  bool isPlaying = true;
  bool isFullscreen = false;
  double volume = 1.0;

  DesktopPlayer get playerInstance => widget.playerInstance;
  Player get player => widget.player;

  late StreamSubscription<bool> playPauseStream;
  late AnimationController playPauseController;

  @override
  void initState() {
    super.initState();
    playPauseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    playPauseStream =
        player.streams.playing.listen((event) => setPlaybackMode(event));
    if (player.state.playing) playPauseController.forward();
  }

  @override
  void dispose() {
    playPauseStream.cancel();
    playPauseController.dispose();
    super.dispose();
  }

  void setPlaybackMode(bool isPlaying) {
    if (isPlaying) {
      playPauseController.forward();
    } else {
      playPauseController.reverse();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (player.state.playing) {
          if (displayTapped) {
            setState(() {
              hideControls = true;
              displayTapped = false;
            });
          } else {
            cancelAndRestartTimer();
          }
        } else {
          setState(() => hideControls = true);
        }
      },
      child: MouseRegion(
        cursor:
            hideControls ? SystemMouseCursors.none : SystemMouseCursors.basic,
        onHover: (_) => cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: hideControls,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: hideControls ? 0.0 : 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [Colors.black87, Colors.black54],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      children: [
                        StreamBuilder<Duration>(
                          stream: player.streams.position,
                          builder: (BuildContext context,
                              AsyncSnapshot<Duration> snapshot) {
                            final durationState = snapshot.data;
                            final progress = durationState ?? Duration.zero;
                            final total = player.state.duration;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ProgressBar(
                                progress: progress,
                                total: total,
                                barHeight: 3,
                                timeLabelLocation: TimeLabelLocation.sides,
                                timeLabelType: TimeLabelType.totalTime,
                                onSeek: (duration) {
                                  playerInstance.seek(duration);
                                },
                              ),
                            );
                          },
                        ),
                        StreamBuilder<double>(
                          stream: player.streams.volume,
                          builder: (context, snapshot) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.volume_up),
                                    SizedBox(
                                      width: 150,
                                      child: Slider(
                                        value: volume,
                                        label:
                                            (volume * 100).round().toString(),
                                        divisions: 100,
                                        onChanged: (newValue) {
                                          setState(() {
                                            volume = newValue;
                                            player.setVolume(volume);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        playerInstance.rewind(
                                            const Duration(seconds: 10));
                                      },
                                      icon: const Icon(Icons.replay_10),
                                    ),
                                    IconButton(
                                      color: Colors.white,
                                      iconSize: 40,
                                      icon: AnimatedIcon(
                                          icon: AnimatedIcons.play_pause,
                                          progress: playPauseController),
                                      onPressed: () {
                                        if (player.state.playing) {
                                          player.pause();
                                          playPauseController.reverse();
                                        } else {
                                          player.play();
                                          playPauseController.forward();
                                        }
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        playerInstance.forward(
                                          const Duration(seconds: 10),
                                        );
                                      },
                                      icon: const Icon(Icons.forward_10),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        playerInstance.forward(
                                          const Duration(
                                              minutes: 1, seconds: 25),
                                        );
                                      },
                                      icon: const Icon(Icons.fast_forward),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        final nav = Navigator.of(context);
                                        await playerInstance.stop();
                                        nav.pop();
                                      },
                                      icon: const Icon(Icons.stop),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        if (isFullscreen) {
                                          Window.exitFullscreen();
                                        } else {
                                          Window.enterFullscreen();
                                        }

                                        setState(() {
                                          isFullscreen = !isFullscreen;
                                        });
                                      },
                                      icon: Icon(isFullscreen
                                          ? Icons.fullscreen_exit
                                          : Icons.fullscreen),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
