import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Characters extends Equatable {
	final Links? links;

	const Characters({this.links});

	factory Characters.fromMap(Map<String, dynamic> data) => Characters(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Characters].
	factory Characters.fromJson(String data) {
		return Characters.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Characters] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
