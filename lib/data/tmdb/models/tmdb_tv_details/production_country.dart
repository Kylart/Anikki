import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  final String? iso31661;
  final String? name;

  const ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromMap(Map<String, dynamic> data) {
    return ProductionCountry(
      iso31661: data['iso_3166_1'] as String?,
      name: data['name'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'iso_3166_1': iso31661,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductionCountry].
  factory ProductionCountry.fromJson(String data) {
    return ProductionCountry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductionCountry] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [iso31661, name];
}
