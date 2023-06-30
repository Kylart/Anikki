import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'meta.dart';

class PosterImage extends Equatable {
	final String? tiny;
	final String? large;
	final String? small;
	final String? medium;
	final String? original;
	final Meta? meta;

	const PosterImage({
		this.tiny, 
		this.large, 
		this.small, 
		this.medium, 
		this.original, 
		this.meta, 
	});

	factory PosterImage.fromMap(Map<String, dynamic> data) => PosterImage(
				tiny: data['tiny'] as String?,
				large: data['large'] as String?,
				small: data['small'] as String?,
				medium: data['medium'] as String?,
				original: data['original'] as String?,
				meta: data['meta'] == null
						? null
						: Meta.fromMap(data['meta'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'tiny': tiny,
				'large': large,
				'small': small,
				'medium': medium,
				'original': original,
				'meta': meta?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PosterImage].
	factory PosterImage.fromJson(String data) {
		return PosterImage.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [PosterImage] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [tiny, large, small, medium, original, meta];
}
