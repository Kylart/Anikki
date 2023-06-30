import 'dart:convert';

import 'package:equatable/equatable.dart';

class Tiny extends Equatable {
	final int? width;
	final int? height;

	const Tiny({this.width, this.height});

	factory Tiny.fromMap(Map<String, dynamic> data) => Tiny(
				width: data['width'] as int?,
				height: data['height'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'width': width,
				'height': height,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tiny].
	factory Tiny.fromJson(String data) {
		return Tiny.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Tiny] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [width, height];
}
