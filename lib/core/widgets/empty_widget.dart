import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.title = 'Nothing to see here',
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
            'assets/images/jinrui.png',
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
