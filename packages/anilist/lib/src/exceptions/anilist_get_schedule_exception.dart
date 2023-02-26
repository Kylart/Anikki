class AnilistGetScheduleException implements Exception {
  final String cause = 'Could not retrieve Airing schedule from Anilist';
  String? error;

  AnilistGetScheduleException({ this.error });
}