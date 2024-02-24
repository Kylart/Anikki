import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:anikki/core/core.dart';

import '../extractors/extractors.dart';
import '../models/models.dart';
import '../utils/utils.dart';

/// Adapted from `https://github.com/consumet/consumet.ts/blob/master/src/providers/anime/gogoanime.ts`
class Gogoanime implements AnimeProvider {
  final baseUrl = 'https://anitaku.to';
  final logo =
      'https://play-lh.googleusercontent.com/MaGEiAEhNHAJXcXKzqTNgxqRmhuKB1rCUgb15UrN_mWUNRnLpO5T1qja64oRasO7mn0';
  final ajaxUrl = 'https://ajax.gogo-load.com';

  final client = Client();

  @override
  Future<List<AnimeResult>> search(
    String query, {
    bool dubbed = false,
  }) async {
    final List<AnimeResult> results = [];

    final res = await client.get(
      Uri.parse(
        '$baseUrl/search.html?keyword=${Uri.encodeComponent(dubbed ? '$query (Dub)' : query)}&page=1',
      ),
    );

    final document = parse(res.body);

    document.querySelectorAll('div.last_episodes > ul > li').forEach(
          (element) => results.add(
            AnimeResult(
              id: element
                  .querySelector('p.name > a')
                  ?.attributes['href']
                  ?.split('/')[2],
              title: element.querySelector('p.name > a')?.attributes['title'],
              url:
                  '$baseUrl/${element.querySelector('p.name > a')?.attributes['href']}',
              subOrDub: element
                          .querySelector('p.name > a')
                          ?.text
                          .toLowerCase()
                          .contains('dub') ==
                      true
                  ? SubOrDub.dub
                  : SubOrDub.sub,
            ),
          ),
        );

    return results;
  }

  @override
  Future<List<AnimeEpisode>> fetchAnimeEpisodes(String id) async {
    if (!id.contains('gogoanime')) id = '$baseUrl/category/$id';

    final res = await client.get(Uri.parse(id));
    final document = parse(res.body);

    final epStart = document
        .querySelectorAll('#episode_page > li')
        .first
        .querySelector('a')
        ?.attributes['ep_start'];
    final epEnd = document
        .querySelectorAll('#episode_page > li')
        .last
        .querySelector('a')
        ?.attributes['ep_end'];
    final movieId = document.querySelector('#movie_id')?.attributes['value'];
    final alias = document.querySelector('#alias_anime')?.attributes['value'];

    final res2 = await client.get(
      Uri.parse(ajaxUrl).replace(
        pathSegments: [
          'ajax',
          'load-list-episode',
        ],
        queryParameters: {
          'ep_start': epStart,
          'ep_end': epEnd,
          'id': movieId,
          'alias': alias,
          'default_ep': '0'
        },
      ),
    );
    final document2 = parse(res2.body);

    final episodes = document2
        .querySelectorAll('#episode_related > li')
        .map(
          (el) => AnimeEpisode(
            id: el.querySelector('a')?.attributes['href']?.split('/')[1],
            number: int.tryParse(
                el.querySelector('div.name')?.text.replaceAll('EP ', '') ?? ''),
            url:
                '$baseUrl/${el.querySelector('a')?.attributes['href']?.trim()}',
          ),
        )
        .toList()
        .reversed
        .toList();

    return episodes;
  }

  @override
  Future<AnimeSource> fetchEpisodeSources(
    String episodeId, {
    StreamingServers server = StreamingServers.vidstreaming,
  }) async {
    final res = await client.get(Uri.parse('$baseUrl/$episodeId'));
    final document = parse(res.body);

    Uri? uri;

    switch (server) {
      case StreamingServers.vidstreaming:
        final uriString = document
            .querySelector(
                'div.anime_video_body > div.anime_muti_link > ul > li.vidcdn > a')
            ?.attributes['data-video'];

        uri = Uri.tryParse(uriString ?? '');
        break;
      case StreamingServers.streamsb:
        final uriString = document
            .querySelector(
                'div.anime_video_body > div.anime_muti_link > ul > li.streamsb > a')
            ?.attributes['data-video'];

        uri = Uri.tryParse(uriString ?? '');
        break;
      case StreamingServers.gogocdn:
      default:
        final uriString = document
            .querySelector('#load_anime > div > div > iframe')
            ?.attributes['src'];

        uri = Uri.tryParse(uriString ?? '');
        break;
    }

    if (uri == null) throw NoEpisodeSourceException;

    return switch (server) {
      StreamingServers.streamsb => AnimeSource(
          headers: {
            'Referer': uri.toString(),
            'watchsb': 'streamsb',
            'User-Agent': userAgent,
          },
          sources: await StreamSB().extract(uri),
          download: 'https://gogohd.net/download?${uri.query}',
        ),
      StreamingServers.gogocdn || _ => AnimeSource(
          headers: {
            'Referer': uri.toString(),
          },
          sources: await GogoCDN().extract(uri),
          download: 'https://gogohd.net/download?${uri.query}',
        )
    };
  }
}
