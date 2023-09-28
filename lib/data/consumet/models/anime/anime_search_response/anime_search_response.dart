import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'anime_search_response_result.dart';
export 'anime_search_response_result.dart';

class AnimeSearchResponse extends Equatable {
  final String? currentPage;
  final bool? hasNextPage;
  final List<AnimeSearchResponseResult>? results;

  const AnimeSearchResponse({
    this.currentPage,
    this.hasNextPage,
    this.results,
  });

  factory AnimeSearchResponse.fromMap(Map<String, dynamic> data) {
    return AnimeSearchResponse(
      currentPage: data['currentPage'] as String?,
      hasNextPage: data['hasNextPage'] as bool?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) =>
              AnimeSearchResponseResult.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'currentPage': currentPage,
        'hasNextPage': hasNextPage,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnimeSearchResponse].
  factory AnimeSearchResponse.fromJson(String data) {
    return AnimeSearchResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnimeSearchResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [currentPage, hasNextPage, results];
}
