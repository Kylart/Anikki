class AnilistSearchException implements Exception {
  final String cause = 'Could not search on Anilsit';
  String? error;

  AnilistSearchException({this.error});
}
