import 'package:flutter/material.dart';

abstract class VideoPlayer {
  Widget widget();
  Future<void> stop();
}
