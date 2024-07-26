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
