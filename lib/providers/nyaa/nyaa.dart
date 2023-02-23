import 'package:flutter/foundation.dart';

import 'package:anikki/providers/nyaa/nyaa_client.dart';
import 'package:anikki/providers/nyaa/types/torrent.dart';
import 'package:quiver/collection.dart';

class NyaaStore with ChangeNotifier, DiagnosticableTreeMixin, NyaaClient {
  String fansub = 'SubsPlease';
  String quality = '720p';
  String term = '';

  Map<String, List<Torrent>> results = LruMap(maximumSize: 10);

  Future<List<Torrent>> search(String term) async {
    try {
      if (results.containsKey(term) && results[term]!.isNotEmpty) {
        return results[term]!;
      }

      final result = await getAll(term: term);

      results[term] = result;
      notifyListeners();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(StringProperty('quality', quality));
    properties.add(StringProperty('fansub', fansub));
    properties.add(StringProperty('term', term));
    properties.add(
        DiagnosticsProperty<Map<String, List<Torrent>>>('results', results));
  }
}
