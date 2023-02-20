import 'package:http/http.dart';

import 'package:kawanime/providers/nyaa/types/torrent.dart';

import './utils.dart' as utils;

class NyaaStandalone {
  String baseUrl = 'nyaa.si';
  final Client client = Client();

  Future<Map<String, dynamic>> _searchPage({String? term, int? page}) async {
    final options = {
      'f': '0',
      'c': '1_0',
      'p': page?.toString() ?? '1',
      's': 'id',
      'o': 'desc',
      'q': term ?? ''
    };

    final uri = Uri.https(baseUrl, '/', options);
    final response = await get(uri);

    return utils.extractFromHtml(
      data: response.body,
      baseUrl: baseUrl,
    );
  }

  Future<List<Torrent>> search({String? term}) async {
    final Map<String, dynamic> firstPage = await _searchPage(term: term);

    List<Torrent> results = firstPage['results'];
    int maxPage = firstPage['maxPage'];

    // Current page starts at 2 because we already did one research.
    int currentPage = 2;

    // Should be enough for a few weeks of content.
    const int maxResults = 150;

    while (results.length < maxResults && currentPage < maxPage) {
      final Map<String, dynamic> current =
          await _searchPage(term: term, page: currentPage);

      results.addAll(current['results']);

      ++currentPage;
    }

    return results;
  }
}
