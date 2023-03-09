import 'dart:async';

import 'package:flutter/material.dart';

mixin ControlsMixin<T extends StatefulWidget> on State<T> {
  Timer? _hideTimer;
  bool hideControls = true;
  bool displayTapped = false;

  void cancelAndRestartTimer() {
    _hideTimer?.cancel();

    if (mounted) {
      _startHideTimer();

      setState(() {
        hideControls = false;
        displayTapped = true;
      });
    }
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          hideControls = true;
          displayTapped = false;
        });
      }
    });
  }
}