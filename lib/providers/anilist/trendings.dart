import 'package:graphql/client.dart';
import 'package:kawanime/helpers/season.dart';
import 'package:kawanime/providers/anilist/types/media/media.dart';

import './queries/trends.dart';

class AnilistTrendings {
  AnilistTrendings({required GraphQLClient client}) {
    _client = client;
  }

  late GraphQLClient _client;

  List<Media> trending = [];
  List<Media> season = [];
  List<Media> nextSeason = [];
  List<Media> popular = [];
  List<Media> top = [];

  Future<void> getTrendings() async {
    String currentSeason = getSeason(next: false);
    final int currentYear = DateTime.now().year;

    final QueryOptions options = QueryOptions(
      document: gql(trendsQuery),
      variables: <String, dynamic>{
        'season': currentSeason,
        'seasonYear': currentYear,
        'nextSeason': getSeason(next: true),
        'nextYear': currentSeason == 'FALL' ? currentYear + 1 : currentYear
      },
    );

    final QueryResult result = await _client.query(options);

    trending.addAll((result.data?['trending']['media'] as List<dynamic>)
        .map((data) => Media.fromJson(data)));

    season.addAll((result.data?['season']['media'] as List<dynamic>)
        .map((data) => Media.fromJson(data)));

    nextSeason.addAll((result.data?['nextSeason']['media'] as List<dynamic>)
        .map((data) => Media.fromJson(data)));

    popular.addAll((result.data?['popular']['media'] as List<dynamic>)
        .map((data) => Media.fromJson(data)));

    top.addAll((result.data?['top']['media'] as List<dynamic>)
        .map((data) => Media.fromJson(data)));
  }
}
