import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class AnimeCharacters extends Equatable {
	final Links? links;

	const AnimeCharacters({this.links});

	factory AnimeCharacters.fromMap(Map<String, dynamic> data) {
		return AnimeCharacters(
			links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnimeCharacters].
	factory AnimeCharacters.fromJson(String data) {
		return AnimeCharacters.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AnimeCharacters] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
