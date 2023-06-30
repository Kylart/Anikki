import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Reviews extends Equatable {
	final Links? links;

	const Reviews({this.links});

	factory Reviews.fromMap(Map<String, dynamic> data) => Reviews(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Reviews].
	factory Reviews.fromJson(String data) {
		return Reviews.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Reviews] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
