import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key,
    required this.grayscaled,
    required this.media,
  });

  final bool grayscaled;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        grayscaled ? Colors.grey.withOpacity(0.4) : Colors.transparent,
        BlendMode.saturation,
      ),
      child: Image(
        fit: BoxFit.fitHeight,
        image: media.coverImage != null
            ? CachedNetworkImageProvider(
                media.coverImage!,
              )
            : const AssetImage('assets/images/placeholder.jpg'),
      ),
    );
  }
}
