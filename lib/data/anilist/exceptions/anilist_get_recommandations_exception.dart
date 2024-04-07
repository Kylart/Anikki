class AnilistGetRecommendationsException implements Exception {
  final String cause = 'Could not retrieve recommandations from Anilist';
  String? error;

  AnilistGetRecommendationsException({this.error});
}
