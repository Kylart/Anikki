part of 'drawer_content.dart';

class DrawerEpisodeDeleteButton extends StatefulWidget {
  const DrawerEpisodeDeleteButton({
    super.key,
    required this.file,
  });

  final LocalFile file;

  @override
  State<DrawerEpisodeDeleteButton> createState() =>
      _DrawerEpisodeDeleteButtonState();
}

class _DrawerEpisodeDeleteButtonState extends State<DrawerEpisodeDeleteButton>
    with TickerProviderStateMixin {
  final angle = pi / 8;

  AnimationController? controller;
  Timer? timer;

  @override
  void dispose() {
    controller?.dispose();
    timer?.cancel();
    super.dispose();
  }

  void onPressed() {
    if (controller != null) {
      BlocProvider.of<LibraryBloc>(context).add(
        LibraryFileDeleteRequested(widget.file),
      );
    }

    setState(() {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        upperBound: 2,
        animationBehavior: AnimationBehavior.preserve,
      )..repeat(reverse: true);
    });

    timer = Timer(
      const Duration(seconds: 3),
      () {
        controller?.stop();
        controller?.dispose();

        setState(() {
          controller = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final icon = IconButton(
      onPressed: onPressed,
      iconSize: 18.0,
      constraints: const BoxConstraints(),
      color: controller == null ? Colors.orange : Colors.red,
      icon: Icon(
        controller == null
            ? HugeIcons.strokeRoundedDelete02
            : HugeIcons.strokeRoundedDelete04,
      ),
    );

    if (controller != null) {
      return AnimatedBuilder(
        animation: controller!,
        builder: (context, child) => Transform.rotate(
          angle: controller!.value * angle - angle,
          child: icon,
        ),
      );
    }

    return icon;
  }
}
