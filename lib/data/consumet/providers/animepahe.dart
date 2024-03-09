import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:anikki/data/consumet/extractors/extractors.dart';
import 'package:anikki/data/data.dart';

class Animepahe extends AnimeProvider {
  final baseUrl = 'https://animepahe.com/';
  final logo = 'https://animepahe.com/pikacon.ico';

  final client = Client();

  Map<String, String> get baseHeaders => {
        'Referer': baseUrl,
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36',
      };

  Future<Map<String, String>> _getCookies(String url) async {
    final res = await client.get(
      Uri.parse('https://check.ddos-guard.net/check.js'),
      headers: {
        'referer': url,
      },
    );

    final ddg2 = res.headers['set-cookie']
        ?.split('; ')
        .firstWhere((element) => element.startsWith('__ddg2='));

    return {
      'Cookie': ddg2 ?? '',
    };
  }

  @override
  Future<List<AnimeResult>> search(
    String query, {
    bool dubbed = false,
  }) async {
    final List<AnimeResult> result = [];
    final uri = Uri.parse(baseUrl).replace(
      path: 'api',
      queryParameters: {
        'm': 'search',
        'q': query,
      },
    );

    final res = await client.get(
      uri,
      headers: {
        ...baseHeaders,
        ...(await _getCookies(uri.toString())),
      },
    );

    final resJson = json.decode(res.body);
    final entries = resJson['results'];

    for (final entry in entries) {
      result.add(
        AnimeResult(
          id: '${entry['id']}/${entry['session']}',
          title: entry['title'],
        ),
      );
    }

    return result;
  }

  @override
  Future<List<AnimeEpisode>> fetchAnimeEpisodes(String id) async {
    final List<AnimeEpisode> result = [];

    int page = 1;
    int lastPage = 2;

    do {
      final res = await client.get(
        Uri.parse(baseUrl).replace(
          path: 'api',
          queryParameters: {
            'm': 'release',
            'id': id.split('/')[1],
            'sort': 'episode_asc',
            'page': page,
          },
        ),
      );

      final body = json.decode(res.body);
      final data = body['data'];
      lastPage = int.parse(body['last_page']);

      result.addAll(data.map(
        (item) => AnimeEpisode(
          number: item['episode'],
          id: '${id.split('/')[1]}/${item['session']}',
          url: '$baseUrl/play/${id.split('/')[1]}/${item['session']}',
        ),
      ));

      page++;
    } while (page < lastPage);

    return result;
  }

  @override
  Future<AnimeSource> fetchEpisodeSources(
    AnimeEpisode episode, {
    StreamingServers server = StreamingServers.vidstreaming,
  }) async {
    final res = await client.get(
      Uri.parse(baseUrl).replace(
        pathSegments: [
          'play',
          episode.id,
        ],
      ),
      headers: {
        'Referer': baseUrl,
      },
    );

    final document = parse(res.body);
    List<VideoSource> sources = [];

    final links = document.querySelectorAll('div#resolutionMenu > button').map(
          (element) => {
            'url': element.attributes['data-src'],
            'quality': element.text,
            'audio': element.attributes['data-audio'],
          },
        );

    for (final link in links) {
      final kwikRes = await Kwik().extract(Uri.parse(link['url'] ?? ''));
      sources.add(
        VideoSource(
          url: kwikRes.first.url,
          quality: link['quality'],
          isM3U8: kwikRes.first.isM3U8,
          isDASH: kwikRes.first.isDASH,
          size: kwikRes.first.size,
        ),
      );
    }

    return AnimeSource(
      headers: const {
        'Referer': 'https://kwik.cx/',
      },
      sources: sources,
      download: '',
    );
  }
}
