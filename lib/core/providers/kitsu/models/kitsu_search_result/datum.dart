import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'attributes.dart';
import 'links.dart';
import 'relationships.dart';

class Datum extends Equatable {
	final String? id;
	final String? type;
	final Links? links;
	final Attributes? attributes;
	final Relationships? relationships;

	const Datum({
		this.id, 
		this.type, 
		this.links, 
		this.attributes, 
		this.relationships, 
	});

	factory Datum.fromMap(Map<String, dynamic> data) => Datum(
				id: data['id'] as String?,
				type: data['type'] as String?,
				links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
				attributes: data['attributes'] == null
						? null
						: Attributes.fromMap(data['attributes'] as Map<String, dynamic>),
				relationships: data['relationships'] == null
						? null
						: Relationships.fromMap(data['relationships'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'type': type,
				'links': links?.toMap(),
				'attributes': attributes?.toMap(),
				'relationships': relationships?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, type, links, attributes, relationships];
}
