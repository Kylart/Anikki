import 'package:flutter/material.dart';

DateTimeRange computeRange() {
  return DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now()
        .add(const Duration(days: 1))
        .copyWith(hour: 23, minute: 59, second: 59),
  );
}
