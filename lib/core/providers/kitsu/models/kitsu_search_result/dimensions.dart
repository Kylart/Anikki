import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'large.dart';
import 'medium.dart';
import 'small.dart';
import 'tiny.dart';

class Dimensions extends Equatable {
	final Tiny? tiny;
	final Large? large;
	final Small? small;
	final Medium? medium;

	const Dimensions({this.tiny, this.large, this.small, this.medium});

	factory Dimensions.fromMap(Map<String, dynamic> data) => Dimensions(
				tiny: data['tiny'] == null
						? null
						: Tiny.fromMap(data['tiny'] as Map<String, dynamic>),
				large: data['large'] == null
						? null
						: Large.fromMap(data['large'] as Map<String, dynamic>),
				small: data['small'] == null
						? null
						: Small.fromMap(data['small'] as Map<String, dynamic>),
				medium: data['medium'] == null
						? null
						: Medium.fromMap(data['medium'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'tiny': tiny?.toMap(),
				'large': large?.toMap(),
				'small': small?.toMap(),
				'medium': medium?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dimensions].
	factory Dimensions.fromJson(String data) {
		return Dimensions.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Dimensions] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [tiny, large, small, medium];
}
