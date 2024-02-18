part of 'entry_card.dart';

class _HomeEntryCardScaleAnimation extends StatelessWidget {
  const _HomeEntryCardScaleAnimation({
    required this.child,
    required this.controller,
  });

  final Widget child;
  final Animation controller;

  double get scaleValue => controller.value * 0.09 + 1;
  double get tiltValue => controller.value * -1.1;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.diagonal3Values(scaleValue, scaleValue, 1.0)
          ..setEntry(3, 2, 0.01)
          ..rotateX(tiltValue * pi / 180),
        child: child,
      ),
      child: child,
    );
  }
}
