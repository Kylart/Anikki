import 'dart:convert';

import 'package:equatable/equatable.dart';

class Medium extends Equatable {
	final int? width;
	final int? height;

	const Medium({this.width, this.height});

	factory Medium.fromMap(Map<String, dynamic> data) => Medium(
				width: data['width'] as int?,
				height: data['height'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'width': width,
				'height': height,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Medium].
	factory Medium.fromJson(String data) {
		return Medium.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Medium] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [width, height];
}
