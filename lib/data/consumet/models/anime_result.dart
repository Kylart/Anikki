// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  AnimeResult copyWith({
    String? id,
    String? title,
    String? url,
    SubOrDub? subOrDub,
  }) {
    return AnimeResult(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      subOrDub: subOrDub ?? this.subOrDub,
    );
  }
}
