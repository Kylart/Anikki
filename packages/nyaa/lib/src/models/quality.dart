enum Quality {
  low,
  medium,
  high,
}

extension QualityValue on Quality {
  String get value {
    switch (this) {
      case Quality.low:
        return '480p';
      case Quality.medium:
        return '720p';
      case Quality.high:
        return '1080p';
    }
  }
}
