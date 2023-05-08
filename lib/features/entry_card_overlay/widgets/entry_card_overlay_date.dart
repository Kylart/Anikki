import 'dart:async';

import 'package:flutter/material.dart';

class EntryCardOverlayDate extends StatefulWidget {
  const EntryCardOverlayDate({
    super.key,
    required this.title,
    required this.date,
  });

  final String title;
  final DateTime date;

  @override
  State<EntryCardOverlayDate> createState() => _EntryCardOverlayDateState();
}

class _EntryCardOverlayDateState extends State<EntryCardOverlayDate> {
  late Timer timer;

  Duration timeUntil = Duration.zero;
  String get formattedTimeUntil {
    if (timeUntil.inDays != 0) {
      return '${timeUntil.inDays} days, ${timeUntil.inHours.remainder(24)} hours.';
    }
    if (timeUntil.inHours != 0) {
      return '${timeUntil.inHours.remainder(24)} hours, ${timeUntil.inMinutes.remainder(60)} minutes.';
    }

    return '${timeUntil.inMinutes.remainder(60)} minutes.';
  }

  @override
  void initState() {
    timeUntil = widget.date.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeUntil = widget.date.difference(DateTime.now());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(widget.title),
      subtitle: Text('Airing in $formattedTimeUntil'),
    );
  }
}