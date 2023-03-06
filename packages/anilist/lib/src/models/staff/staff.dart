import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'image.dart';
import 'name.dart';

@immutable
class Staff {
  final int? id;
  final String? siteUrl;
  final List<String>? primaryOccupations;
  final Name? name;
  final Image? image;

  const Staff({
    this.id,
    this.siteUrl,
    this.primaryOccupations,
    this.name,
    this.image,
  });

  @override
  String toString() {
    return 'Staff(id: $id, siteUrl: $siteUrl, primaryOccupations: $primaryOccupations, name: $name, image: $image)';
  }

  factory Staff.fromMap(Map<String, dynamic> data) => Staff(
        id: data['id'] as int?,
        siteUrl: data['siteUrl'] as String?,
        primaryOccupations: (data['primaryOccupations'] as List)
            .map((item) => item as String)
            .toList(),
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
        'primaryOccupations': primaryOccupations,
        'name': name?.toMap(),
        'image': image?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Staff].
  factory Staff.fromJson(String data) {
    return Staff.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Staff] to a JSON string.
  String toJson() => json.encode(toMap());

  Staff copyWith({
    int? id,
    String? siteUrl,
    List<String>? primaryOccupations,
    Name? name,
    Image? image,
  }) {
    return Staff(
      id: id ?? this.id,
      siteUrl: siteUrl ?? this.siteUrl,
      primaryOccupations: primaryOccupations ?? this.primaryOccupations,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Staff) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      siteUrl.hashCode ^
      primaryOccupations.hashCode ^
      name.hashCode ^
      image.hashCode;
}
