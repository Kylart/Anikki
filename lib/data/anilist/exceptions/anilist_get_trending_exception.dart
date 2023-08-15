class AnilistGetTrendingException implements Exception {
  final String cause = 'Could not retrieve trending information from Anilist';
  String? error;

  AnilistGetTrendingException({this.error});
}
