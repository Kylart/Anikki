class AnilistGetInfoException implements Exception {
  final String cause = 'Could not retrieve information from Anilist';
  String? error;

  AnilistGetInfoException({this.error});
}
