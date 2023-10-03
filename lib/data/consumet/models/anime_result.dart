part of 'models.dart';

class AnimeResult extends Equatable {
  const AnimeResult({
    this.id,
    this.title,
    this.url,
    this.subOrDub = SubOrDub.sub,
  });

  final String? id;
  final String? title;
  final String? url;
  final SubOrDub subOrDub;

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        subOrDub,
      ];

  @override
  bool get stringify => true;
}
