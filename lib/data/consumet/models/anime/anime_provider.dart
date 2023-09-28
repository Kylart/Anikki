import 'package:http/http.dart';

import 'anime_info_response/anime_info_response.dart';
import 'anime_search_response/anime_search_response_result.dart';
import 'anime_watch_reponse/anime_watch_reponse.dart';

enum AnimeProviderName {
  animefox,
  animepahe,
  gogoanime,
  zoro,
}

abstract class AnimeProvider {
  const AnimeProvider({
    required this.client,
    required this.providerName,
  });

  final Client client;
  final AnimeProviderName providerName;

  String get baseUrl => 'https://api.consumet.org/anime/${providerName.name}';

  Future<List<AnimeSearchResponseResult>> search(String term);
  Future<AnimeInfoResponse> info(String id);
  Future<AnimeWatchReponse> watch(String id);
}
