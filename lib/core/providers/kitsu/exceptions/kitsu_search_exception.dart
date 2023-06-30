class KitsuSearchException implements Exception {
  const KitsuSearchException([this.error]);

  final Exception? error;

  static const cause = 'Kitsu search failed.';
}
