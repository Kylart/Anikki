import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:anikki/app/home/shared/widgets/home_scroll_view/home_scroll_view.dart';
import 'package:anikki/app/home/widgets/home_entry.dart';
import 'package:anikki/core/core.dart';

class HomeScrollViewLoaderTile extends StatelessWidget {
  const HomeScrollViewLoaderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.inverseSurface.withOpacity(0.4),
        highlightColor: context.colorScheme.inverseSurface.withOpacity(0.8),
        child: Container(
          height: HomeScrollView.getHeight(context),
          width:
              HomeScrollView.getHeight(context) * HomeEntry.expandedAspectRatio,
          decoration: BoxDecoration(
            color: context.colorScheme.inverseSurface,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const AspectRatio(
            aspectRatio: 11 / 16,
          ),
        ),
      ),
    );
  }
}
