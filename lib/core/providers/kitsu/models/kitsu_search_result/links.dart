import 'dart:convert';

import 'package:equatable/equatable.dart';

class Links extends Equatable {
	final String? self;

	const Links({this.self});

	factory Links.fromMap(Map<String, dynamic> data) => Links(
				self: data['self'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'self': self,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Links].
	factory Links.fromJson(String data) {
		return Links.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Links] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [self];
}
