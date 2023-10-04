part of 'models.dart';

class AnimeSource extends Equatable {
  const AnimeSource({
    required this.headers,
    required this.sources,
    required this.download,
  });

  final Map<String, String> headers;
  final List<VideoSource> sources;
  final String download;

  @override
  List<Object> get props => [
        headers,
        sources,
        download,
      ];

  @override
  bool get stringify => true;
}
