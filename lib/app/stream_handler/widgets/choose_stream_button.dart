import 'package:flutter/material.dart';

class ChooseStreamButton extends StatelessWidget {
  const ChooseStreamButton({
    super.key,
    required this.child,
    required this.onTap,
    this.title,
  });

  final Widget child;
  final void Function() onTap;

  /// Will be used as tooltip message. If none is given, there won't be any tooltip.
  final String? title;

  final borderRadius = const BorderRadius.all(Radius.circular(12.0));

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title ?? '',
      verticalOffset: 60,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
