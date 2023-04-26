import 'package:flutter/material.dart';

///
/// [AnikkiActionType] for the [AnikkiAction]'s `type` object.
///
enum AnikkiActionType {
  /// Represents an action that will do something.
  action,

  /// Represents a divider type action.
  divider,
}

///
/// [AnikkiAction] helps represent a common / shared action
/// in `Anikki`.
///
/// It is usually represented in a [ListTile] or something similar.
///
@immutable
class AnikkiAction {
  const AnikkiAction({
    required this.label,
    required this.callback,
    this.trailing,
    this.icon = Icons.question_mark,
    this.type = AnikkiActionType.action,
    this.disabled = false,
  });

  /// Label to show to the user
  final String label;

  /// Callback function for the action
  final void Function(BuildContext context) callback;

  /// Similar to [ListTile.trailiing] property. Defaults to [null].
  final Widget? trailing;

  /// Icon to show to the user. Defaults to [Icons.question_mark].
  final IconData icon;

  /// [AnikkiActionType] for this [AnikkiAction]. Defautls to [AnikkiActionType.action].
  final AnikkiActionType type;

  /// Represents whether this action should be enable or not. Defaults to [false].
  final bool disabled;
}
