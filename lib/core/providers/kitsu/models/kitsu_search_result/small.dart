import 'dart:convert';

import 'package:equatable/equatable.dart';

class Small extends Equatable {
	final int? width;
	final int? height;

	const Small({this.width, this.height});

	factory Small.fromMap(Map<String, dynamic> data) => Small(
				width: data['width'] as int?,
				height: data['height'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'width': width,
				'height': height,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Small].
	factory Small.fromJson(String data) {
		return Small.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Small] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [width, height];
}
