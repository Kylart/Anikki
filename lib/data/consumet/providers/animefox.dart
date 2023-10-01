import 'dart:convert';

import 'package:anikki/data/consumet/models/models.dart';

class AnimefoxProvider extends AnimeProvider {
  AnimefoxProvider({
    super.providerName = AnimeProviderName.animefox,
  });

  @override
  Future<AnimeInfoResponse> info(String id) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/info?id=$id'));
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AnimeInfoResponse.fromMap(decodedResponse);
    } catch (e) {
      throw AnimefoxError(details: e.toString());
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
      throw AnimefoxError(details: e.toString());
    }
  }

  @override
  Future<AnimeWatchReponse> watch(String id) async {
    try {
      final response =
          await client.get(Uri.parse('$baseUrl/watch?episodeId=$id'));
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return AnimeWatchReponse.fromMap(decodedResponse);
    } catch (e) {
      throw AnimefoxError(details: e.toString());
    }
  }
}
