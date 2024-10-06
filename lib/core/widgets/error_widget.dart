import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.title = 'Something went wrong...',
    this.description,
    this.width = 500,
    this.height = 500,
  });

  final String title;
  final String? description;

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
            'assets/images/angry_gabriel.png',
            height: height * 3 / 4,
          ),
          Center(
            child: ListTile(
              title: AutoSizeText(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              subtitle: description != null
                  ? AutoSizeText(
                      description!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
