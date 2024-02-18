import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AnikkiPage extends Equatable {
  AnikkiPage({
    required this.child,
    required this.name,
    required this.icon,
    selectedIcon,
    this.error,
  }) {
    this.selectedIcon = selectedIcon ?? icon;
  }

  final Widget child;
  final String name;
  final IconData icon;
  late final IconData selectedIcon;
  final String? error;

  @override
  List<Object?> get props => [
        child,
        name,
        icon,
        selectedIcon,
        error,
      ];
}
