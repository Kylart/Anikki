part of 'models.dart';

class AnimeEpisode extends Equatable {
  const AnimeEpisode({
    required this.number,
    required this.id,
    required this.url,
  });

  final int? number;
  final String? id;
  final String? url;

  @override
  List<Object?> get props => [
        number,
        id,
        url,
      ];

  @override
  bool get stringify => true;
}
