import 'dart:io';

import 'package:flutter/material.dart';

abstract class VideoPlayer {
  Platform platform = Platform();

  bool get isDesktop;

  Widget widget();

  void play();
  void pause();
  void togglePlay();
  void stop();
  void seek(Duration duration);

  void show();

  void setVolume(double value);
  void setRate(double rate);
}