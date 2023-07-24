part of 'models.dart';

class HtmlResult {
  HtmlResult({
    required this.torrents,
    required this.maxPage,
  });

  final List<NyaaTorrent> torrents;
  final int maxPage;
}
