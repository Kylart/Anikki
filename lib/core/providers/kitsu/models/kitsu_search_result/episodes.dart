import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Episodes extends Equatable {
	final Links? links;

	const Episodes({this.links});

	factory Episodes.fromMap(Map<String, dynamic> data) => Episodes(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Episodes].
	factory Episodes.fromJson(String data) {
		return Episodes.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Episodes] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
