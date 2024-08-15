import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'result.dart';

class TmdbSearch extends Equatable {
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  const TmdbSearch({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TmdbSearch.fromMap(Map<String, dynamic> data) => TmdbSearch(
        page: data['page']?.toInt() as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalPages: data['total_pages']?.toInt() as int?,
        totalResults: data['total_results']?.toInt() as int?,
      );

  Map<String, dynamic> toMap() => {
        'page': page,
        'results': results?.map((e) => e.toMap()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TmdbSearch].
  factory TmdbSearch.fromJson(String data) {
    return TmdbSearch.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TmdbSearch] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
