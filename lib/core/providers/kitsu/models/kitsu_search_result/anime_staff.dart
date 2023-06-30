import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class AnimeStaff extends Equatable {
	final Links? links;

	const AnimeStaff({this.links});

	factory AnimeStaff.fromMap(Map<String, dynamic> data) => AnimeStaff(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnimeStaff].
	factory AnimeStaff.fromJson(String data) {
		return AnimeStaff.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AnimeStaff] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
