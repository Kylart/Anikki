part of 'models.dart';

abstract class AnimeProvider {
  Future<List<AnimeResult>> search(String query);

  Future<List<AnimeEpisode>> fetchAnimeEpisodes(String id);

  Future<AnimeSource> fetchEpisodeSources(
    String episodeId, {
    StreamingServers server = StreamingServers.vidstreaming,
  });
}
