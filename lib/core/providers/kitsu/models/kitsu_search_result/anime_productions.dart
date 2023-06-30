import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class AnimeProductions extends Equatable {
	final Links? links;

	const AnimeProductions({this.links});

	factory AnimeProductions.fromMap(Map<String, dynamic> data) {
		return AnimeProductions(
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
  /// Parses the string and returns the resulting Json object as [AnimeProductions].
	factory AnimeProductions.fromJson(String data) {
		return AnimeProductions.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AnimeProductions] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
