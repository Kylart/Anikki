import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

import 'package:anikki/core/core.dart';

/// Repository to handle video player needs
class VideoPlayerRepository {
  const VideoPlayerRepository();

  /// Handles fullscreen events
  void handleFullscreen(bool isFullscreen) {
    if (isFullscreen) {
      if (isDesktop()) {
        windowManager.setFullScreen(false);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
        ]);
      }
    } else {
      if (isDesktop()) {
        windowManager.setFullScreen(true);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
    }
  }
}
