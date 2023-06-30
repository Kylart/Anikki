import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'links.dart';

class MediaRelationships extends Equatable {
	final Links? links;

	const MediaRelationships({this.links});

	factory MediaRelationships.fromMap(Map<String, dynamic> data) {
		return MediaRelationships(
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
  /// Parses the string and returns the resulting Json object as [MediaRelationships].
	factory MediaRelationships.fromJson(String data) {
		return MediaRelationships.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [MediaRelationships] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [links];
}
