import 'dart:async';

import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';

class EpisodeTimerCountdown extends StatefulWidget {
  const EpisodeTimerCountdown({
    super.key,
    required this.airingAt,
    this.textAlign = TextAlign.center,
  });

  final int airingAt;

  final TextAlign textAlign;

  @override
  State<EpisodeTimerCountdown> createState() => _EpisodeTimerCountdownState();
}

class _EpisodeTimerCountdownState extends State<EpisodeTimerCountdown> {
  Timer? interval;

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(
        widget.airingAt * 1000,
      );
  Duration timeUntilDate = Duration.zero;

  String get timeUntilDateLabel => timeUntilDate.isNegative
      ? 'Aired!'
      : 'Airing in ${formatDuration(timeUntilDate)}';

  @override
  void initState() {
    super.initState();

    setState(() {
      timeUntilDate = date.difference(DateTime.now());
    });

    interval = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          timeUntilDate = date.difference(DateTime.now());
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    interval?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timeUntilDateLabel,
      textAlign: widget.textAlign,
    );
  }
}
