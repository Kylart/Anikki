import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/media_details/show.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

part 'entry_card_background_sweep_animation.dart';
part 'entry_card_cover.dart';
part 'entry_card_scale_animation.dart';
part 'entry_card_text.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({
    super.key,
    required this.media,
    this.libraryEntry,
    this.text,
  });

  final Media media;
  final LibraryEntry? libraryEntry;
  final String? text;

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard>
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
      final currentHomeMedia = homeBloc.state.currentMedia;

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
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => showMediaDialog(
          context,
          widget.media,
          widget.libraryEntry,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
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
          child: _EntryCardScaleAnimation(
            controller: animation,
            child: _EntryCardBackgroundSweepAnimation(
              enabled: shouldAnimate,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: _EntryCardCover(
                        animation: animation,
                        color: widget.media.anilistInfo.coverImage?.color,
                        url: widget.media.coverImage,
                      ),
                    ),
                    if (widget.text != null)
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: _EntryCardText(
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
