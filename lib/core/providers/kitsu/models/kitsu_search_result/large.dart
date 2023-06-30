import 'dart:convert';

import 'package:equatable/equatable.dart';

class Large extends Equatable {
	final int? width;
	final int? height;

	const Large({this.width, this.height});

	factory Large.fromMap(Map<String, dynamic> data) => Large(
				width: data['width'] as int?,
				height: data['height'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'width': width,
				'height': height,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Large].
	factory Large.fromJson(String data) {
		return Large.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Large] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [width, height];
}
