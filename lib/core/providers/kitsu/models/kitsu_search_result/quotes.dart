import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Quotes extends Equatable {
	final Links? links;

	const Quotes({this.links});

	factory Quotes.fromMap(Map<String, dynamic> data) => Quotes(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Quotes].
	factory Quotes.fromJson(String data) {
		return Quotes.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Quotes] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
