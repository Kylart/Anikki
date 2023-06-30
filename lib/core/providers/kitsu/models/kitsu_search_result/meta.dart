import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'dimensions.dart';

class Meta extends Equatable {
	final Dimensions? dimensions;

	const Meta({this.dimensions});

	factory Meta.fromMap(Map<String, dynamic> data) => Meta(
				dimensions: data['dimensions'] == null
						? null
						: Dimensions.fromMap(data['dimensions'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'dimensions': dimensions?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meta].
	factory Meta.fromJson(String data) {
		return Meta.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Meta] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [dimensions];
}
