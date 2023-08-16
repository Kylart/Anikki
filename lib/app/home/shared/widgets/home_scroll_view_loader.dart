import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/app/home/shared/widgets/home_scroll_view.dart';

class HomeScrollViewLoader extends StatelessWidget {
  const HomeScrollViewLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScrollView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.white,
            child: Container(
              height: 290,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const AspectRatio(
                aspectRatio: 11 / 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
