import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/media_dialog/shared/show.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/config/config.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

part 'home_entry_card_cover.dart';
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

class _HomeEntryCardState extends State<HomeEntryCard> {
  /// Interval for outline animation
  Timer? interval;

  /// Angle used for the outlined gradient animation
  double angle = 0.0;

  /// Keep track of hovering state
  bool hovered = false;

  void setUpInterval() {
    interval = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        angle += pi / 20;

        if (angle >= pi * 2) angle = 0.0;
      });
    });
  }

  void closeInterval() {
    interval?.cancel();
  }

  @override
  void dispose() {
    interval?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void changeMedia() {
      BlocProvider.of<HomeBloc>(context).add(
        HomeMediaChanged(widget.media),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: GestureDetector(
        onTap: () => showMediaDialog(context, widget.media),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            changeMedia();
            setState(() {
              hovered = true;
              setUpInterval();
            });
          },
          onExit: (event) {
            setState(() {
              hovered = false;
              closeInterval();
            });
          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: hovered ? const EdgeInsets.all(1.0) : null,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              gradient: hovered
                  ? SweepGradient(
                      startAngle: angle,
                      endAngle: angle + (pi * 2),
                      tileMode: TileMode.mirror,
                      colors: const [
                        Colors.white70,
                        Colors.black,
                        Colors.white,
                        Colors.white,
                        Colors.black,
                        Colors.white70,
                      ],
                    )
                  : null,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: Stack(
                children: [
                  _HomeEntryCardCover(
                    glossy: hovered,
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
    );
  }
}
