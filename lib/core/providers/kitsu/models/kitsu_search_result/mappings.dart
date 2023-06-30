import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Mappings extends Equatable {
	final Links? links;

	const Mappings({this.links});

	factory Mappings.fromMap(Map<String, dynamic> data) => Mappings(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Mappings].
	factory Mappings.fromJson(String data) {
		return Mappings.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Mappings] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
