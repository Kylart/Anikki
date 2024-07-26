class AnilistGetActvitiesException implements Exception {
  final String cause = 'Could not retrieve aFctvities information from Anilist';
  String? error;

  AnilistGetActvitiesException({this.error});
}
