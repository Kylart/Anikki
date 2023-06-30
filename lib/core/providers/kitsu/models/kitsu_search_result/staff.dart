import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class Staff extends Equatable {
	final Links? links;

	const Staff({this.links});

	factory Staff.fromMap(Map<String, dynamic> data) => Staff(
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Staff].
	factory Staff.fromJson(String data) {
		return Staff.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Staff] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
