import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class MacosTitleBar extends StatefulWidget {
  const MacosTitleBar({super.key});

  @override
  State<MacosTitleBar> createState() => _MacosTitleBarState();
}

class _MacosTitleBarState extends State<MacosTitleBar> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onDoubleTap: () async {
              if (await windowManager.isMaximized() &&
                  await windowManager.isMinimizable() &&
                  size != null) {
                await windowManager.setSize(
                  size!,
                  animate: true,
                );
              } else {
                if (await windowManager.isMaximizable()) {
                  size = await windowManager.getSize();
                  windowManager.maximize();
                }
              }
            },
            child: Container(
              height: 25,
              width: MediaQuery.of(context).size.width * 0.85,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
