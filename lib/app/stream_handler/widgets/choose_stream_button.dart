import 'package:flutter/material.dart';

class ChooseStreamButton extends StatelessWidget {
  const ChooseStreamButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final void Function() onTap;

  final radius = const Radius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(radius),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(radius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
