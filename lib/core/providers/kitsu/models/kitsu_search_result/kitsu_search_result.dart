import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class KitsuSearchResult extends Equatable {
	final List<Datum>? data;
	final Meta? meta;
	final Links? links;

	const KitsuSearchResult({this.data, this.meta, this.links});

	factory KitsuSearchResult.fromMap(Map<String, dynamic> data) {
		return KitsuSearchResult(
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
						.toList(),
			meta: data['meta'] == null
						? null
						: Meta.fromMap(data['meta'] as Map<String, dynamic>),
			links: data['links'] == null
						? null
						: Links.fromMap(data['links'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'data': data?.map((e) => e.toMap()).toList(),
				'meta': meta?.toMap(),
				'links': links?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KitsuSearchResult].
	factory KitsuSearchResult.fromJson(String data) {
		return KitsuSearchResult.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [KitsuSearchResult] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [data, meta, links];
}
