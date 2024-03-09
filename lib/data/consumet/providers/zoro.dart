import 'dart:convert';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/consumet/extractors/extractors.dart';
import 'package:anikki/data/consumet/utils/utils.dart';
import 'package:anikki/data/data.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class Zoro implements AnimeProvider {
  final baseUrl = 'https://hianime.to';
  final logo =
      'https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/7e/91/00/7e9100ee-2b62-0942-4cdc-e9b93252ce1c/source/512x512bb.jpg';

  final client = Client();

  @override
  Future<List<AnimeResult>> search(
    String query, {
    bool dubbed = false,
  }) async {
    final List<AnimeResult> result = [];

    final url = Uri.parse(
      '$baseUrl/search?keyword=$query&page=1',
    );
    final res = await client.get(url);
    final document = parse(res.body);

    final cards = document.querySelectorAll('.flw-item');

    for (final card in cards) {
      final atag = card.querySelector('.film-name a');
      final hasSubbed =
          int.tryParse(card.querySelector('.tick-item.tick-sub')?.text ?? '') !=
              null;
      final hasDubbed =
          int.tryParse(card.querySelector('.tick-item.tick-dub')?.text ?? '') !=
              null;

      final entry = AnimeResult(
        id: atag?.attributes['href']
            ?.split('/')
            .elementAtOrNull(1)
            ?.split('?')
            .elementAtOrNull(0),
        title: atag?.text,
        url: '$baseUrl${atag?.attributes['href']}',
      );

      if (!dubbed && hasSubbed) {
        result.add(
          entry.copyWith(
            subOrDub: SubOrDub.sub,
          ),
        );
      }

      if (dubbed && hasDubbed) {
        result.add(
          entry.copyWith(
            subOrDub: SubOrDub.dub,
          ),
        );
      }
    }

    return result;
  }

  @override
  Future<List<AnimeEpisode>> fetchAnimeEpisodes(String id) async {
    final res = await client.get(Uri.parse('$baseUrl/watch/$id'));
    final animeDocument = parse(res.body);

    final hasSub = animeDocument
            .querySelector('div.film-stats div.tick div.tick-item.tick-sub') !=
        null;
    final hasDub = animeDocument
            .querySelector('div.film-stats div.tick div.tick-item.tick-dub') !=
        null;

    String subOrDub = 'sub';

    if (hasDub && !hasSub) 'dub';
    if (hasSub && hasDub) subOrDub = 'both';

    final List<AnimeEpisode> result = [];
    final episodesAjax = await client.get(
      Uri.parse('$baseUrl/ajax/v2/episode/list/${id.split('-').last}'),
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Referer': '$baseUrl/watch/$id',
      },
    );

    final document = parse(json.decode(episodesAjax.body)['html']);
    final episodes =
        document.querySelectorAll('div.detail-infor-content > div > a');

    for (final episode in episodes) {
      result.add(
        AnimeEpisode(
          id: '${episode.attributes['href']?.split('/').elementAtOrNull(2)?.replaceFirst('?ep=', r'$episode$')}\$$subOrDub',
          number: int.tryParse(episode.attributes['data-number'] ?? ''),
          url: '$baseUrl${episode.attributes['href']}',
          title: episode.attributes['title'],
        ),
      );
    }

    return result;
  }

  String? _retrieveServerId(Document document, int index, SubOrDub subOrDub) {
    return document
        .querySelectorAll(
            '.ps_-block.ps_-block-sub.servers-${subOrDub.name} > .ps__-list .server-item')
        .map((e) =>
            e.attributes['data-server-id'] == index.toString() ? e : null)
        .firstWhere((element) => element != null)
        ?.attributes['data-id'];
  }

  @override
  Future<AnimeSource> fetchEpisodeSources(
    AnimeEpisode episode, {
    StreamingServers server = StreamingServers.vidcloud,
  }) async {
    if (!episode.id.contains(r'$episode$')) throw 'Invalid episode id';

    final subOrDub =
        episode.id.split(r'$').last == 'dub' ? SubOrDub.dub : SubOrDub.sub;

    final episodeId = '$baseUrl/watch/${episode.id}'
        .replaceFirst(r'$episode$', '?ep=')
        .replaceAll(RegExp(r'\$auto|\$sub|\$dub'), '');

    final res = await client.get(
      Uri.parse(
        '$baseUrl/ajax/v2/episode/servers?episodeId=${episodeId.split('?ep=')[1]}',
      ),
    );

    final document = parse(json.decode(res.body)['html']);

    final serverId = switch (server) {
      StreamingServers.vidcloud => _retrieveServerId(document, 1, subOrDub),
      StreamingServers.vidstreaming => _retrieveServerId(document, 4, subOrDub),
      StreamingServers.streamsb => _retrieveServerId(document, 5, subOrDub),
      StreamingServers.streamtape => _retrieveServerId(document, 3, subOrDub),
      _ => throw UnimplementedError(),
    };

    if (serverId == null) throw ServerNotFoundException();

    final serverRes = await client
        .get(Uri.parse('$baseUrl/ajax/v2/episode/sources?id=$serverId'));
    final link = json.decode(serverRes.body)['link'] as String;

    final result = switch (server) {
      StreamingServers.vidstreaming || StreamingServers.vidcloud => AnimeSource(
          headers: const {},
          sources: await MegaCloud().extract(Uri.parse(link)),
          download: '',
        ),
      StreamingServers.streamtape => AnimeSource(
          headers: {'Referer': link, 'User-Agent': userAgent},
          sources: await StreamTape().extract(Uri.parse(link)),
          download: '',
        ),
      StreamingServers.streamsb => AnimeSource(
          headers: {
            'Referer': link,
            'watchsb': 'streamsb',
            'User-Agent': userAgent,
          },
          sources: await StreamSB().extract(Uri.parse(link)),
          download: '',
        ),
      _ => throw UnimplementedError(),
    };

    return result;
  }
}
