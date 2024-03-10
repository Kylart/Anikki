part of 'models.dart';

final class VideoSubtitle {
  VideoSubtitle({
    required this.url,
    required this.lang,
    this.id,
    this.isDefault = false,
  });

  final String url;
  final String? id;
  final String lang;
  final bool isDefault;
}
