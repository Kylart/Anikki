import 'package:flutter/material.dart';

export 'mobile/mobile_player.dart';
export 'view/anikki_video_player.dart';

abstract class VideoPlayer {
  Widget widget();
  Future<void> stop();
}
