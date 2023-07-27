import 'dart:async';

import 'package:http/http.dart';
import 'package:quiver/collection.dart';

import 'models/models.dart';
import 'extract_from_html.dart';

export 'models/models.dart';
export 'errors/nyaa_no_result_exception.dart';

class Nyaa {
  final String baseUrl = 'nyaa.si';
  final Client client = Client();

  Map<String, List<NyaaTorrent>> resultsCache = LruMap(maximumSize: 10);

  // Should be enough for a few weeks of content.
  final int maxResults = 750;

  Future<List<NyaaTorrent>> search(String term) async {
    if (resultsCache.containsKey(term) && resultsCache[term]!.isNotEmpty) {
      return resultsCache[term]!;
    }

    final result = await _getAll(term: term);

    resultsCache[term] = result;
    Timer(
      const Duration(minutes: 5),
      () => resultsCache.remove(term),
    );

    result.sort((a, b) => int.parse(b.seeders).compareTo(int.parse(a.seeders)));

    return result;
  }

  Future<HtmlResult> _searchPage({String? term, int? page}) async {
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

    return extractFromHtml(
      data: response.body,
      baseUrl: baseUrl,
    );
  }

  Future<List<NyaaTorrent>> _getAll({String? term}) async {
    final firstPage = await _searchPage(term: term);

    final results = firstPage.torrents;
    final maxPage = firstPage.maxPage;

    // Current page starts at 2 because we already did one research.
    int currentPage = 2;

    while (results.length < maxResults && currentPage < maxPage) {
      final current = await _searchPage(term: term, page: currentPage);

      results.addAll(current.torrents);

      ++currentPage;
    }

    return results;
  }
}
