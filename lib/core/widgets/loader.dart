import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/core/widgets/list_view/tile_skeleton.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          int timer = 1000;

          return Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.white38,
            period: Duration(milliseconds: timer),
            child: const TileSkeleton(),
          );
        },
      ),
    );
  }
}
