import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/media_dialog/shared/show.dart';
import 'package:anikki/config/config.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

part 'home_entry_card_background_sweep_animation.dart';
part 'home_entry_card_cover.dart';
part 'home_entry_card_scale_animation.dart';
part 'home_entry_card_text.dart';

class HomeEntryCard extends StatefulWidget {
  const HomeEntryCard({
    super.key,
    required this.media,
    this.text,
  });

  final Media media;
  final String? text;

  @override
  State<HomeEntryCard> createState() => _HomeEntryCardState();
}

class _HomeEntryCardState extends State<HomeEntryCard>
    with SingleTickerProviderStateMixin {
  /// Interval for outline animation
  Timer? interval;

  /// Keep track of hovering state
  bool hovered = false;

  /// If the current home media is this card's media
  bool isCurrentHomeMedia = false;

  bool get shouldAnimate => isDesktop() ? hovered : isCurrentHomeMedia;

  late AnimationController scaleController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 250),
    );

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: scaleController,
        curve: Curves.decelerate,
      ),
    );
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context, listen: true);

    if (!isDesktop()) {
      final currentHomeMedia = homeBloc.state.bannerMedia;

      setState(() {
        isCurrentHomeMedia = currentHomeMedia == widget.media;

        if (isCurrentHomeMedia) {
          scaleController.forward();
        } else {
          scaleController.reverse();
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () => showMediaDialog(context, widget.media),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            homeBloc.add(
              HomeBannerMediaChanged(widget.media),
            );

            setState(() {
              hovered = true;
              scaleController.forward();
            });
          },
          onExit: (event) {
            scaleController
                .reverse()
                .then((value) => setState(() => hovered = false));
          },
          child: _HomeEntryCardScaleAnimation(
            controller: animation,
            child: _HomeEntryCardBackgroundSweepAnimation(
              enabled: shouldAnimate,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    _HomeEntryCardCover(
                      animation: animation,
                      color: widget.media.anilistInfo.coverImage?.color,
                      url: widget.media.coverImage,
                    ),
                    if (widget.text != null)
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: _HomeEntryCardText(
                          text: widget.text!,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
