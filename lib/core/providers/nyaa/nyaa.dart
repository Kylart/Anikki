import 'package:http/http.dart';
import 'package:quiver/collection.dart';

import 'package:anikki/core/providers/nyaa/extract_from_html.dart';
import 'package:anikki/core/providers/nyaa/models/models.dart';

export 'package:anikki/core/providers/nyaa/models/models.dart';
export 'package:anikki/core/providers/nyaa/errors/nyaa_no_result_exception.dart';

class Nyaa {
  final String baseUrl = 'nyaa.si';
  final Client client = Client();

  Map<String, List<Torrent>> results = LruMap(maximumSize: 10);

  Future<List<Torrent>> search(String term) async {
    if (results.containsKey(term) && results[term]!.isNotEmpty) {
      return results[term]!;
    }

    final result = await _getAll(term: term);

    results[term] = result;

    result.sort((a, b) => int.parse(b.seeders).compareTo(int.parse(a.seeders)));

    return result;
  }

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

    return extractFromHtml(
      data: response.body,
      baseUrl: baseUrl,
    );
  }

  Future<List<Torrent>> _getAll({String? term}) async {
    final Map<String, dynamic> firstPage = await _searchPage(term: term);

    List<Torrent> results = firstPage['results'];
    int maxPage = firstPage['maxPage'];

    // Current page starts at 2 because we already did one research.
    int currentPage = 2;

    // Should be enough for a few weeks of content.
    const int maxResults = 750;

    while (results.length < maxResults && currentPage < maxPage) {
      final Map<String, dynamic> current =
          await _searchPage(term: term, page: currentPage);

      results.addAll(current['results']);

      ++currentPage;
    }

    return results;
  }
}
