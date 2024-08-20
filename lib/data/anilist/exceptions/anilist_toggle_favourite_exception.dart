class AnilistToggleFavouriteException implements Exception {
  final String cause = 'Favourite status update failed';
  String? error;

  AnilistToggleFavouriteException({this.error});
}
