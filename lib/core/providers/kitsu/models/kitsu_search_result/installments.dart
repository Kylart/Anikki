import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Installments extends Equatable {
	final Links? links;

	const Installments({this.links});

	factory Installments.fromMap(Map<String, dynamic> data) => Installments(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Installments].
	factory Installments.fromJson(String data) {
		return Installments.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Installments] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
