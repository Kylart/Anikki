import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Castings extends Equatable {
	final Links? links;

	const Castings({this.links});

	factory Castings.fromMap(Map<String, dynamic> data) => Castings(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Castings].
	factory Castings.fromJson(String data) {
		return Castings.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Castings] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
