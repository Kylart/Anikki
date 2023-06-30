import 'dart:convert';

import 'package:equatable/equatable.dart';

class Titles extends Equatable {
	final String? en;
	final String? enJp;
	final String? jaJp;

	const Titles({this.en, this.enJp, this.jaJp});

	factory Titles.fromMap(Map<String, dynamic> data) => Titles(
				en: data['en'] as String?,
				enJp: data['en_jp'] as String?,
				jaJp: data['ja_jp'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'en': en,
				'en_jp': enJp,
				'ja_jp': jaJp,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Titles].
	factory Titles.fromJson(String data) {
		return Titles.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Titles] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [en, enJp, jaJp];
}
