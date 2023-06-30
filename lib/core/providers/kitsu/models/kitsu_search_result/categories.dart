import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Categories extends Equatable {
	final Links? links;

	const Categories({this.links});

	factory Categories.fromMap(Map<String, dynamic> data) => Categories(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Categories].
	factory Categories.fromJson(String data) {
		return Categories.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Categories] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
