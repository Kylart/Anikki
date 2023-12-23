import 'dart:async';

import 'package:flutter/material.dart';

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

  String formatDuration(Duration duration) {
    var result = '';

    final hasDays = duration.inDays != 0;
    final days = duration.inDays;
    final dayTag = days == 1 ? 'day' : 'days';

    final hours = duration.inHours % 24;
    final hasHours = hours != 0;
    final hourTag = hours == 1 ? 'hour' : 'hours';

    final minutes = duration.inMinutes.remainder(60);
    final hasMinutes = minutes != 0;
    const minuteTag = 'min';

    if (hasDays) {
      result += '$days $dayTag';

      if (hasHours) {
        result += ', $hours $hourTag';
      }

      return result;
    }

    if (hasHours) {
      result += '$hours $hourTag';

      if (hasMinutes) {
        result += ', $minutes $minuteTag';
      }

      return result;
    }

    return '$minutes $minuteTag';
  }

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
