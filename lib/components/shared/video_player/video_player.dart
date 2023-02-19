import 'dart:io';

import 'package:flutter/material.dart';

abstract class VideoPlayer {
  Platform platform = Platform();

  Widget widget();

  void play();
  void pause();
  void togglePlay();
  Future<void> stop();
  void seek(Duration duration);

  void setVolume(double value);
  void setRate(double rate);
}