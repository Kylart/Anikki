import 'package:anikki/core/core.dart';
import 'package:flutter/material.dart';

class HomeBackgroundImage extends StatelessWidget {
  const HomeBackgroundImage({
    super.key,
    required this.media,
  });

  final Media media;

  String? get backgroundImage {
    final images = media.tmdbInfo?.images?.backdrops;

    if (images != null && images.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/original${images.first.filePath}';
    }

    return media.bannerImage ?? media.coverImage;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topCenter,
          children: <Widget>[
            Column(
              children: [
                ...previousChildren.map(
                  (e) => Expanded(child: e),
                )
              ],
            ),
            if (currentChild != null)
              Column(
                children: [
                  Expanded(child: currentChild),
                ],
              ),
          ],
        );
      },
      child: backgroundImage != null
          ? Image.network(
              key: ValueKey(media.title),
              backgroundImage!,
              fit: BoxFit.cover,
            )
          : const SizedBox(),
    );
  }
}
