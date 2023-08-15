class AnilistGetRecommandationsException implements Exception {
  final String cause = 'Could not retrieve recommandations from Anilist';
  String? error;

  AnilistGetRecommandationsException({this.error});
}
