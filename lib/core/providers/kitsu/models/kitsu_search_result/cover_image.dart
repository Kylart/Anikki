import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'meta.dart';

class CoverImage extends Equatable {
	final String? tiny;
	final String? large;
	final String? small;
	final String? original;
	final Meta? meta;

	const CoverImage({
		this.tiny, 
		this.large, 
		this.small, 
		this.original, 
		this.meta, 
	});

	factory CoverImage.fromMap(Map<String, dynamic> data) => CoverImage(
				tiny: data['tiny'] as String?,
				large: data['large'] as String?,
				small: data['small'] as String?,
				original: data['original'] as String?,
				meta: data['meta'] == null
						? null
						: Meta.fromMap(data['meta'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'tiny': tiny,
				'large': large,
				'small': small,
				'original': original,
				'meta': meta?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CoverImage].
	factory CoverImage.fromJson(String data) {
		return CoverImage.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CoverImage] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [tiny, large, small, original, meta];
}
