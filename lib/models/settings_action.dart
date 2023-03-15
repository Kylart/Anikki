import 'package:flutter/material.dart';

class SettingsAction {
  final String label;
  final IconData? icon;
  final Widget trailing;
  final void Function() callback;

  SettingsAction({
    required this.label,
    required this.trailing,
    required this.callback,
    this.icon,
  });
}
