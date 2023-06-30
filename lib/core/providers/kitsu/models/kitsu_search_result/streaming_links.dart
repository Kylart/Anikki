import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class StreamingLinks extends Equatable {
	final Links? links;

	const StreamingLinks({this.links});

	factory StreamingLinks.fromMap(Map<String, dynamic> data) {
		return StreamingLinks(
			links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StreamingLinks].
	factory StreamingLinks.fromJson(String data) {
		return StreamingLinks.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [StreamingLinks] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
