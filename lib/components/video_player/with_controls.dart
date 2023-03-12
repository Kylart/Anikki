import 'package:anikki/components/video_player/controls_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcPlayerWithControls extends StatefulWidget {
  final VlcPlayerController controller;

  const VlcPlayerWithControls({super.key, required this.controller});

  @override
  VlcPlayerWithControlsState createState() => VlcPlayerWithControlsState();
}

class VlcPlayerWithControlsState extends State<VlcPlayerWithControls>
    with AutomaticKeepAliveClientMixin, ControlsMixin {
  late VlcPlayerController _controller;

  double sliderValue = 0.0;
  String position = '';
  String duration = '';
  int numberOfCaptions = 0;
  int numberOfAudioTracks = 0;
  bool validPosition = false;
  List<double> playbackSpeeds = [0.5, 1.0, 1.5, 2.0];
  int playbackSpeedIndex = 1;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(listener);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  void listener() async {
    if (!mounted) return;
    //
    if (_controller.value.isInitialized) {
      final oPosition = _controller.value.position;
      final oDuration = _controller.value.duration;

      if (oDuration.inHours == 0) {
        final strPosition = oPosition.toString().split('.')[0];
        final strDuration = oDuration.toString().split('.')[0];
        position = "${strPosition.split(':')[1]}:${strPosition.split(':')[2]}";
        duration = "${strDuration.split(':')[1]}:${strDuration.split(':')[2]}";
      } else {
        position = oPosition.toString().split('.')[0];
        duration = oDuration.toString().split('.')[0];
      }

      validPosition = oDuration.compareTo(oPosition) >= 0;
      sliderValue = validPosition ? oPosition.inSeconds.toDouble() : 0;

      numberOfCaptions = _controller.value.spuTracksCount;
      numberOfAudioTracks = _controller.value.audioTracksCount;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _seekRelative(Duration(seconds: (details.delta.dx).toInt()));
        cancelAndRestartTimer();
      },
      onLongPress: () {
        _togglePlaying();
        cancelAndRestartTimer();
      },
      onTap: () {
        if (displayTapped) {
          setState(() {
            hideControls = true;
            displayTapped = false;
          });
        } else {
          cancelAndRestartTimer();
        }
      },
      child: Container(
        color: Colors.transparent,
        child: IgnorePointer(
          ignoring: hideControls,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () {
                          _seekRelative(const Duration(seconds: -10));
                          cancelAndRestartTimer();
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () {
                          _seekRelative(const Duration(seconds: 10));
                          cancelAndRestartTimer();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: VlcPlayer(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                  placeholder: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedOpacity(
                      opacity: hideControls ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: [Colors.black87, Colors.black54],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              color: Colors.white,
                              icon: _controller.value.isPlaying
                                  ? const Icon(Icons.pause_circle_outline)
                                  : const Icon(Icons.play_circle_outline),
                              onPressed: _togglePlaying,
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.fast_forward),
                              onPressed: () {
                                _seekRelative(const Duration(seconds: 85));
                                cancelAndRestartTimer();
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    position,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Expanded(
                                    child: Slider(
                                      activeColor: Colors.redAccent,
                                      inactiveColor: Colors.white70,
                                      value: sliderValue,
                                      min: 0.0,
                                      max: (!validPosition)
                                          ? 1.0
                                          : _controller.value.duration.inSeconds
                                              .toDouble(),
                                      onChanged: validPosition
                                          ? _onSliderPositionChanged
                                          : null,
                                    ),
                                  ),
                                  Text(
                                    duration,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Wrap(
                                    children: [
                                      Stack(
                                        children: [
                                          IconButton(
                                            tooltip: 'Get Subtitle Tracks',
                                            icon: const Icon(
                                                Icons.closed_caption),
                                            color: Colors.white,
                                            onPressed: _getSubtitleTracks,
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: IgnorePointer(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 1,
                                                  horizontal: 2,
                                                ),
                                                child: Text(
                                                  '$numberOfCaptions',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          IconButton(
                                            tooltip: 'Get Audio Tracks',
                                            icon: const Icon(Icons.audiotrack),
                                            color: Colors.white,
                                            onPressed: _getAudioTracks,
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: IgnorePointer(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 1,
                                                  horizontal: 2,
                                                ),
                                                child: Text(
                                                  '$numberOfAudioTracks',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.timer),
                                            color: Colors.white,
                                            onPressed: _cyclePlaybackSpeed,
                                          ),
                                          Positioned(
                                            bottom: 7,
                                            right: 3,
                                            child: IgnorePointer(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 1,
                                                  horizontal: 2,
                                                ),
                                                child: Text(
                                                  '${playbackSpeeds.elementAt(playbackSpeedIndex)}x',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.cast),
                                        color: Colors.white,
                                        onPressed: _getRendererDevices,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.fullscreen),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _seekRelative(Duration seekStep) async {
    await _controller.seekTo(_controller.value.position + seekStep);
  }

  void _cyclePlaybackSpeed() async {
    playbackSpeedIndex++;
    if (playbackSpeedIndex >= playbackSpeeds.length) {
      playbackSpeedIndex = 0;
    }
    return await _controller
        .setPlaybackSpeed(playbackSpeeds.elementAt(playbackSpeedIndex));
  }

  void _togglePlaying() async {
    _controller.value.isPlaying
        ? await _controller.pause()
        : await _controller.play();
  }

  void _onSliderPositionChanged(double progress) {
    setState(() {
      sliderValue = progress.floor().toDouble();
    });
    //convert to Milliseconds since VLC requires MS to set time
    _controller.setTime(sliderValue.toInt() * 1000);
  }

  void _getSubtitleTracks() async {
    final subtitleTracks = await _controller.getSpuTracks();
    //
    if (mounted && subtitleTracks.isNotEmpty) {
      final selectedSubId = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Subtitle'),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: subtitleTracks.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < subtitleTracks.keys.length
                          ? subtitleTracks.values.elementAt(index).toString()
                          : 'Disable',
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < subtitleTracks.keys.length
                            ? subtitleTracks.keys.elementAt(index)
                            : -1,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );

      if (selectedSubId != null) await _controller.setSpuTrack(selectedSubId);
    }
  }

  void _getAudioTracks() async {
    var audioTracks = await _controller.getAudioTracks();
    //
    if (mounted && audioTracks.isNotEmpty) {
      var selectedAudioTrackId = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Audio'),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: audioTracks.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < audioTracks.keys.length
                          ? audioTracks.values.elementAt(index).toString()
                          : 'Disable',
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < audioTracks.keys.length
                            ? audioTracks.keys.elementAt(index)
                            : -1,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );
      if (selectedAudioTrackId != null) {
        await _controller.setAudioTrack(selectedAudioTrackId);
      }
    }
  }

  void _getRendererDevices() async {
    var castDevices = await _controller.getRendererDevices();
    //
    if (mounted && castDevices.isNotEmpty) {
      var selectedCastDeviceName = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Display Devices'),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: ListView.builder(
                itemCount: castDevices.keys.length + 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      index < castDevices.keys.length
                          ? castDevices.values.elementAt(index).toString()
                          : 'Disconnect',
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        index < castDevices.keys.length
                            ? castDevices.keys.elementAt(index)
                            : null,
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );
      await _controller.castToRenderer(selectedCastDeviceName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No Display Device Found!')));
    }
  }
}
