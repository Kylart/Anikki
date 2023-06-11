class AnilistUpdateListException implements Exception {
  final String cause = 'Anilist list update failed';
  String? error;

  AnilistUpdateListException({this.error});
}
