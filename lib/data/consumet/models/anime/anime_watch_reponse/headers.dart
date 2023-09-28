// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Headers extends Equatable {
  final String? referer;
  final String? watchsb;
  final String? userAgent;

  const Headers({
    this.referer,
    this.watchsb,
    this.userAgent,
  });

  factory Headers.fromMap(Map<String, dynamic> map) {
    return Headers(
      referer: map['referer'] != null ? map['referer'] as String : null,
      watchsb: map['watchsb'] != null ? map['watchsb'] as String : null,
      userAgent: map['User-Agent'] != null ? map['User-Agent'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'referer': referer,
      'watchsb': watchsb,
      'userAgent': userAgent,
    };
  }

  factory Headers.fromJson(String source) =>
      Headers.fromMap(json.decode(source) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Headers] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        referer,
        watchsb,
        userAgent,
      ];

  Headers copyWith({
    String? referer,
    String? watchsb,
    String? userAgent,
  }) {
    return Headers(
      referer: referer ?? this.referer,
      watchsb: watchsb ?? this.watchsb,
      userAgent: userAgent ?? this.userAgent,
    );
  }
}
