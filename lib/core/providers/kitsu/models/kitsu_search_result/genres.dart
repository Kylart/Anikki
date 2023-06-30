import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Genres extends Equatable {
	final Links? links;

	const Genres({this.links});

	factory Genres.fromMap(Map<String, dynamic> data) => Genres(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Genres].
	factory Genres.fromJson(String data) {
		return Genres.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Genres] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
