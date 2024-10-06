import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:anikki/app/home/widgets/landscape/home_title/home_title.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/loading_widget.dart';

class HomeLoader extends StatelessWidget {
  const HomeLoader({
    super.key,
    required this.carouselSize,
  });

  final Size carouselSize;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceContainerHighest;
    final textColor = context.colorScheme.onSurface.withOpacity(0.5);

    return Stack(
      children: [
        Positioned(
          left: 16,
          top: 16,
          child: SizedBox.fromSize(
            size: const Size(700, 235),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        color: textColor,
                      ),
                      child: const SizedBox(
                        width: 650,
                        height: 75,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final i
                              in List.generate(3, (index) => index)) ...[
                            if (i != 0) const Text(' • '),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                color: textColor,
                              ),
                              child: const SizedBox(
                                width: 150,
                                height: 45,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                    AbsorbPointer(
                      absorbing: true,
                      child: HomeTitleActions(
                        media: Media(),
                      ),
                    ),
                  ],
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .fadeIn(duration: 1.2.seconds)
                  .fadeOut(delay: 300.ms, duration: 1.2.seconds),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: SizedBox.fromSize(
            size: carouselSize,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                ),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (final i in List.generate(8, (index) => index))
                          Padding(
                            padding: i == 0
                                ? const EdgeInsets.only(right: 12.0)
                                : const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                            child: Container(
                              height: i == 0
                                  ? carouselSize.height
                                  : carouselSize.height / 1.3,
                              decoration: BoxDecoration(
                                color: textColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: const AspectRatio(aspectRatio: 9 / 14),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16.0,
                    left: carouselSize.height * 9 / 14 + 24,
                    width:
                        carouselSize.width - carouselSize.height * 9 / 14 - 48,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        color: textColor,
                      ),
                      child: const SizedBox(
                        width: 650,
                        height: 45,
                      ),
                    ),
                  ),
                ],
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .fadeIn(duration: 1.2.seconds)
                  .fadeOut(delay: 300.ms, duration: 1.2.seconds),
            ),
          ),
        ),
        const Positioned.fill(
          child: Align(
            alignment: Alignment(0.0, -0.2),
            child: LoadingWidget(
              width: 400,
              height: 400,
            ),
          ),
        ),
      ],
    );
  }
}
