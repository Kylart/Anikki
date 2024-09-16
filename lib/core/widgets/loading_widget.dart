import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.title = 'Loading...',
    this.subtitle,
    this.width = 500,
    this.height = 500,
  });

  final String title;
  final String? subtitle;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/videos/tohru.gif',
            height: height * 3 / 4,
          ),
          Center(
            child: ListTile(
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              subtitle: subtitle == null
                  ? null
                  : Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
