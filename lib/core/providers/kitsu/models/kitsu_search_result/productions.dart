import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Productions extends Equatable {
	final Links? links;

	const Productions({this.links});

	factory Productions.fromMap(Map<String, dynamic> data) => Productions(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Productions].
	factory Productions.fromJson(String data) {
		return Productions.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Productions] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
