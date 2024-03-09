part of 'models.dart';

abstract class AnimeProvider {
  Future<List<AnimeResult>> search(
    String query, {
    bool dubbed = false,
  });

  Future<List<AnimeEpisode>> fetchAnimeEpisodes(String id);

  Future<AnimeSource> fetchEpisodeSources(
    AnimeEpisode episode, {
    StreamingServers server = StreamingServers.vidstreaming,
  });
}
