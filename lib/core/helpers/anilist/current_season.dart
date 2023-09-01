import 'package:anikki/data/data.dart';

Enum$MediaSeason currentSeason() {
  final month = DateTime.now().month;

  if (month <= 3) {
    return Enum$MediaSeason.WINTER;
  } else if (month <= 6) {
    return Enum$MediaSeason.SPRING;
  } else if (month <= 9) {
    return Enum$MediaSeason.SUMMER;
  }

  return Enum$MediaSeason.FALL;
}
