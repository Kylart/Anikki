part of 'models.dart';

class AnimeEpisode extends Equatable {
  const AnimeEpisode({
    required this.id,
    this.number,
    this.url,
    this.title,
  });

  final int? number;
  final String id;
  final String? url;
  final String? title;

  @override
  List<Object?> get props => [
        number,
        id,
        url,
        title,
      ];

  @override
  bool get stringify => true;
}
