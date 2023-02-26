import 'dart:convert';

import 'package:flutter/material.dart';

import 'avatar.dart';
import 'options.dart';

@immutable
class AnilistUser {
  final String name;
  final Avatar? avatar;
  final String? bannerImage;
  final bool? isBlocked;
  final Options? options;

  const AnilistUser({
    required this.name,
    this.avatar,
    this.bannerImage,
    this.isBlocked,
    this.options,
  });

  @override
  String toString() {
    return 'AnilistUser(name: $name, avatar: $avatar, bannerImage: $bannerImage, isBlocked: $isBlocked, options: $options)';
  }

  factory AnilistUser.fromMap(Map<String, dynamic> data) => AnilistUser(
        name: data['name'] as String,
        avatar: data['avatar'] == null
            ? null
            : Avatar.fromMap(data['avatar'] as Map<String, dynamic>),
        bannerImage: data['bannerImage'] as dynamic,
        isBlocked: data['isBlocked'] as bool?,
        options: data['options'] == null
            ? null
            : Options.fromMap(data['options'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'avatar': avatar?.toMap(),
        'bannerImage': bannerImage,
        'isBlocked': isBlocked,
        'options': options?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnilistUser].
  factory AnilistUser.fromJson(String data) {
    return AnilistUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnilistUser] to a JSON string.
  String toJson() => json.encode(toMap());
}
