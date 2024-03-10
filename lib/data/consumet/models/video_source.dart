part of 'models.dart';

class VideoSource extends Equatable {
  const VideoSource({
    required this.url,
    this.quality,
    this.isM3U8,
    this.isDASH,
    this.size,
    this.subtitles,
  });

  final String url;
  final String? quality;
  final bool? isM3U8;
  final bool? isDASH;
  final double? size;
  final List<VideoSubtitle>? subtitles;

  @override
  List<Object?> get props {
    return [
      url,
      quality,
      isM3U8,
      isDASH,
      size,
      subtitles,
    ];
  }

  @override
  bool get stringify => true;
}
