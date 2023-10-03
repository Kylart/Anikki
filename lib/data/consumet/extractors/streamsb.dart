import 'dart:convert';

import 'package:http/http.dart';

import '../models/models.dart';
import '../utils/utils.dart';

/// Adapted from `https://github.com/consumet/consumet.ts/blob/master/src/extractors/streamsb.ts`
class StreamSB extends Extractor {
  final host = 'https://streamsss.net/sources50';
  final host2 = 'https://watchsb.com/sources50';

  final client = Client();

  String payload(String hex) =>
      '566d337678566f743674494a7c7c${hex}7c7c346b6767586d6934774855537c7c73747265616d7362/6565417268755339773461447c7c346133383438333436313335376136323337373433383634376337633465366534393338373136643732373736343735373237613763376334363733353737303533366236333463353333363534366137633763373337343732363536313664373336327c7c6b586c3163614468645a47617c7c73747265616d7362';

  @override
  Future<List<VideoSource>> extract(Uri uri) async {
    final List<VideoSource> results = [];
    Map<String, String> headers = {
      'watchsb': 'sbstream',
      'User-Agent': userAgent,
      'Referer': uri.toString(),
    };

    var id = uri.toString().split('/e/').lastOrNull;
    if (id?.contains('html') == true) id = id?.split('.html').firstOrNull;

    if (id == null) throw 'cannot find ID';

    final res = await client.get(
      Uri.parse(
        '$host/${payload(utf8.encode(id).map((e) => e.toRadixString(16)).join())}',
      ),
      headers: headers,
    );
    final jsonResponse = json.decode(res.body);

    if (jsonResponse['stream_data'] == null) {
      throw 'No source found. Try a different server.';
    }

    headers = {
      'User-Agent': userAgent,
      'Referer': uri.toString().split('e/').first,
    };

    final m3u8Urls = await client.get(
      Uri.parse(jsonResponse['stream_data']['file']),
      headers: headers,
    );

    final videoList = m3u8Urls.body.split('#EXT-X-STREAM-INF:');

    for (final video in videoList) {
      if (!video.contains('m3u8')) continue;

      final url = video.split('\n')[1];
      final quality = video.split('RESOLUTION=')[1].split(',')[0].split('x')[1];

      results.add(
        VideoSource(
          url: url,
          quality: '${quality}p',
          isM3U8: true,
        ),
      );
    }

    results.add(
      VideoSource(
        url: jsonResponse['stream_data']['file'],
        quality: 'auto',
        isM3U8: jsonResponse['stream_data']['file'].contains('.m3u8'),
      ),
    );

    return results;
  }
}
