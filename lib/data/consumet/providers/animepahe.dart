import 'dart:convert';

import 'package:anikki/data/consumet/models/anime/anime.dart';

class AnimepaheError {
  const AnimepaheError([this.details]);

  final AnimeProviderName name = AnimeProviderName.animepahe;
  final String? details;
}

class AnimepaheProvider extends AnimeProvider {
  AnimepaheProvider({
    required super.client,
    super.providerName = AnimeProviderName.animepahe,
  });

  @override
  Future<AnimeInfoResponse> info(String id) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/info/$id'));
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AnimeInfoResponse.fromMap(decodedResponse);
    } catch (e) {
      throw AnimepaheError(e.toString());
    }
  }

  @override
  Future<List<AnimeSearchResponseResult>> search(String term) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/search/$term'));
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      final results = AnimeSearchResponse.fromMap(decodedResponse).results;

      return results ?? [];
    } catch (e) {
      throw AnimepaheError(e.toString());
    }
  }

  @override
  Future<AnimeWatchReponse> watch(String id) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/watch/$id'));
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AnimeWatchReponse.fromMap(decodedResponse);
    } catch (e) {
      throw AnimepaheError(e.toString());
    }
  }
}
