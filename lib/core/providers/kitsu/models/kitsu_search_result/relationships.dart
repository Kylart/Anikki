import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'anime_characters.dart';
import 'anime_productions.dart';
import 'anime_staff.dart';
import 'castings.dart';
import 'categories.dart';
import 'characters.dart';
import 'episodes.dart';
import 'genres.dart';
import 'installments.dart';
import 'mappings.dart';
import 'media_relationships.dart';
import 'productions.dart';
import 'quotes.dart';
import 'reviews.dart';
import 'staff.dart';
import 'streaming_links.dart';

class Relationships extends Equatable {
	final Genres? genres;
	final Categories? categories;
	final Castings? castings;
	final Installments? installments;
	final Mappings? mappings;
	final Reviews? reviews;
	final MediaRelationships? mediaRelationships;
	final Characters? characters;
	final Staff? staff;
	final Productions? productions;
	final Quotes? quotes;
	final Episodes? episodes;
	final StreamingLinks? streamingLinks;
	final AnimeProductions? animeProductions;
	final AnimeCharacters? animeCharacters;
	final AnimeStaff? animeStaff;

	const Relationships({
		this.genres, 
		this.categories, 
		this.castings, 
		this.installments, 
		this.mappings, 
		this.reviews, 
		this.mediaRelationships, 
		this.characters, 
		this.staff, 
		this.productions, 
		this.quotes, 
		this.episodes, 
		this.streamingLinks, 
		this.animeProductions, 
		this.animeCharacters, 
		this.animeStaff, 
	});

	factory Relationships.fromMap(Map<String, dynamic> data) => Relationships(
				genres: data['genres'] == null
						? null
						: Genres.fromMap(data['genres'] as Map<String, dynamic>),
				categories: data['categories'] == null
						? null
						: Categories.fromMap(data['categories'] as Map<String, dynamic>),
				castings: data['castings'] == null
						? null
						: Castings.fromMap(data['castings'] as Map<String, dynamic>),
				installments: data['installments'] == null
						? null
						: Installments.fromMap(data['installments'] as Map<String, dynamic>),
				mappings: data['mappings'] == null
						? null
						: Mappings.fromMap(data['mappings'] as Map<String, dynamic>),
				reviews: data['reviews'] == null
						? null
						: Reviews.fromMap(data['reviews'] as Map<String, dynamic>),
				mediaRelationships: data['mediaRelationships'] == null
						? null
						: MediaRelationships.fromMap(data['mediaRelationships'] as Map<String, dynamic>),
				characters: data['characters'] == null
						? null
						: Characters.fromMap(data['characters'] as Map<String, dynamic>),
				staff: data['staff'] == null
						? null
						: Staff.fromMap(data['staff'] as Map<String, dynamic>),
				productions: data['productions'] == null
						? null
						: Productions.fromMap(data['productions'] as Map<String, dynamic>),
				quotes: data['quotes'] == null
						? null
						: Quotes.fromMap(data['quotes'] as Map<String, dynamic>),
				episodes: data['episodes'] == null
						? null
						: Episodes.fromMap(data['episodes'] as Map<String, dynamic>),
				streamingLinks: data['streamingLinks'] == null
						? null
						: StreamingLinks.fromMap(data['streamingLinks'] as Map<String, dynamic>),
				animeProductions: data['animeProductions'] == null
						? null
						: AnimeProductions.fromMap(data['animeProductions'] as Map<String, dynamic>),
				animeCharacters: data['animeCharacters'] == null
						? null
						: AnimeCharacters.fromMap(data['animeCharacters'] as Map<String, dynamic>),
				animeStaff: data['animeStaff'] == null
						? null
						: AnimeStaff.fromMap(data['animeStaff'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'genres': genres?.toMap(),
				'categories': categories?.toMap(),
				'castings': castings?.toMap(),
				'installments': installments?.toMap(),
				'mappings': mappings?.toMap(),
				'reviews': reviews?.toMap(),
				'mediaRelationships': mediaRelationships?.toMap(),
				'characters': characters?.toMap(),
				'staff': staff?.toMap(),
				'productions': productions?.toMap(),
				'quotes': quotes?.toMap(),
				'episodes': episodes?.toMap(),
				'streamingLinks': streamingLinks?.toMap(),
				'animeProductions': animeProductions?.toMap(),
				'animeCharacters': animeCharacters?.toMap(),
				'animeStaff': animeStaff?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Relationships].
	factory Relationships.fromJson(String data) {
		return Relationships.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Relationships] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				genres,
				categories,
				castings,
				installments,
				mappings,
				reviews,
				mediaRelationships,
				characters,
				staff,
				productions,
				quotes,
				episodes,
				streamingLinks,
				animeProductions,
				animeCharacters,
				animeStaff,
		];
	}
}
