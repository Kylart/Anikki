import 'dart:convert';

import 'package:anikki/data/data.dart';
import 'package:equatable/equatable.dart';

class Media extends Equatable {
  Media({
    Fragment$shortMedia? anilistInfo,
  }) {
    this.anilistInfo = anilistInfo ?? Fragment$shortMedia(id: 0);
  }

  late final Fragment$shortMedia anilistInfo;

  String? get title => anilistInfo.title?.userPreferred;
  String? get coverImage =>
      anilistInfo.coverImage?.extraLarge ??
      anilistInfo.coverImage?.large ??
      anilistInfo.coverImage?.medium;
  String? get bannerImage => anilistInfo.bannerImage;

  @override
  List<Object> get props => [
        anilistInfo,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'anilistInfo': anilistInfo.toJson(),
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      anilistInfo: Fragment$shortMedia.fromJson(
        map['anilistInfo'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Media.fromJson(String source) =>
      Media.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
