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
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              subtitle: description != null
                  ? Text(
                      description!,
                      textAlign: TextAlign.center,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
