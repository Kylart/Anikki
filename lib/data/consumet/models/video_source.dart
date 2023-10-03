part of 'models.dart';

class VideoSource extends Equatable {
  const VideoSource({
    required this.url,
    this.quality,
    this.isM3U8,
    this.isDASH,
    this.size,
  });

  final String url;
  final String? quality;
  final bool? isM3U8;
  final bool? isDASH;
  final double? size;

  @override
  List<Object?> get props {
    return [
      url,
      quality,
      isM3U8,
      isDASH,
      size,
    ];
  }

  @override
  bool get stringify => true;
}
