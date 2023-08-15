import 'dart:math';

import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) {
    final placeholder = Image.asset('assets/images/cover_placeholder.jpg');

    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.transparent],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, min(rect.height, 1000)),
        );
      },
      blendMode: BlendMode.dstIn,
      child: url == null
          ? placeholder
          : Image.network(
              url!,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return placeholder;
              },
            ),
    );
  }
}
