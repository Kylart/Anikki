import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'image.dart';
import 'name.dart';

@immutable
class Character {
  final int? id;
  final String? siteUrl;
  final String? description;
  final Name? name;
  final Image? image;

  const Character(
      {this.id, this.siteUrl, this.description, this.name, this.image});

  @override
  String toString() {
    return 'Character(id: $id, siteUrl: $siteUrl, description: $description, name: $name, image: $image)';
  }

  factory Character.fromMap(Map<String, dynamic> data) => Character(
        id: data['id'] as int?,
        siteUrl: data['siteUrl'] as String?,
        description: data['description'] as String?,
        name: data['name'] == null
            ? null
            : Name.fromMap(data['name'] as Map<String, dynamic>),
        image: data['image'] == null
            ? null
            : Image.fromMap(data['image'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'siteUrl': siteUrl,
        'description': description,
        'name': name?.toMap(),
        'image': image?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Character].
  factory Character.fromJson(String data) {
    return Character.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Character] to a JSON string.
  String toJson() => json.encode(toMap());

  Character copyWith({
    int? id,
    String? siteUrl,
    String? description,
    Name? name,
    Image? image,
  }) {
    return Character(
      id: id ?? this.id,
      siteUrl: siteUrl ?? this.siteUrl,
      description: description ?? this.description,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.siteUrl == siteUrl &&
        other.description == description &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        siteUrl.hashCode ^
        description.hashCode ^
        name.hashCode ^
        image.hashCode;
  }
}
