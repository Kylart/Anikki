class AnilistGetListException implements Exception {
  final String cause = 'Could not retrieve Watch list from Anilist';
  String? error;

  AnilistGetListException({this.error});
}
