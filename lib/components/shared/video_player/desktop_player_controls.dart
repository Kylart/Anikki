import 'dart:async';

import 'package:flutter/material.dart';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:dart_vlc/dart_vlc.dart';

import 'package:kawanime/components/shared/video_player/desktop_player.dart';
import 'package:window_manager/window_manager.dart';


// Inspired by https://github.com/alexmercerind/dart_vlc/blob/master/lib/src/widgets/controls.dart
class DesktopPlayerControls extends StatefulWidget {
  const DesktopPlayerControls({super.key, required this.player});

  final DesktopPlayer player;
  Player get vlcPlayer => player.player;

  @override
  State<DesktopPlayerControls> createState() => _DesktopPlayerControlsState();
}

class _DesktopPlayerControlsState extends State<DesktopPlayerControls>
    with SingleTickerProviderStateMixin {
  bool isPlaying = true;
  bool isFullscreen = false;
  double volume = 1.0;

  DesktopPlayer get player => widget.player;
  Player get vlcPlayer => player.player;

  late StreamSubscription<PlaybackState> playPauseStream;
  late AnimationController playPauseController;

  @override
  void initState() {
    super.initState();
    playPauseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    playPauseStream = vlcPlayer.playbackStream
        .listen((event) => setPlaybackMode(event.isPlaying));
    if (vlcPlayer.playback.isPlaying) playPauseController.forward();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: [
              StreamBuilder<PositionState>(
                stream: widget.vlcPlayer.positionStream,
                builder: (BuildContext context,
                    AsyncSnapshot<PositionState> snapshot) {
                  final durationState = snapshot.data;
                  final progress = durationState?.position ?? Duration.zero;
                  final total = durationState?.duration ?? Duration.zero;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProgressBar(
                      progress: progress,
                      total: total,
                      barHeight: 3,
                      timeLabelLocation: TimeLabelLocation.sides,
                      timeLabelType: TimeLabelType.totalTime,
                      onSeek: (duration) {
                        player.seek(duration);
                      },
                    ),
                  );
                },
              ),
              StreamBuilder<CurrentState>(
                stream: widget.vlcPlayer.currentStream,
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
                              label: (volume * 100).round().toString(),
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
                              player.rewind(const Duration(seconds: 10));
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
                              if (vlcPlayer.playback.isPlaying) {
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
                              player.forward(
                                const Duration(seconds: 10),
                              );
                            },
                            icon: const Icon(Icons.forward_10),
                          ),
                          IconButton(
                            onPressed: () {
                              player.forward(
                                const Duration(minutes: 1, seconds: 25),
                              );
                            },
                            icon: const Icon(Icons.fast_forward),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          await windowManager.setFullScreen(!isFullscreen);
                          setState(() {
                            isFullscreen = !isFullscreen;
                          });
                        },
                        icon: Icon(isFullscreen
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
