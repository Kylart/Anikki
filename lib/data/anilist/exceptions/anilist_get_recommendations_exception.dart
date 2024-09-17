class AnilistGetRecommendationsException implements Exception {
  final String cause = 'Could not retrieve recommendations from Anilist';
  String? error;

  AnilistGetRecommendationsException({this.error});
}
