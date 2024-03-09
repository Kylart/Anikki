import 'package:anikki/data/consumet/models/models.dart';
import 'package:anikki/data/data.dart';
import 'package:http/http.dart';

class Kwik extends Extractor {
  final serverName = 'kwik';
  final host = 'https://animepahe.com';

  final client = Client();

  @override
  Future<List<VideoSource>> extract(Uri uri) async {
    final res = await client.get(uri, headers: {
      'Referer': host,
    });

    final data = res.body;
    final source = RegExp(r'(eval)(\(f.*?)(\n<\/script>)', dotAll: true)
        .firstMatch(data)!
        .group(2)!
        .replaceFirst('eval', '');
    final match = RegExp(r'https.*?m3u8').firstMatch(source);

    return [
      VideoSource(
        url: match!.group(0)!,
        isM3U8: match.group(0)!.contains('.m3u8'),
      ),
    ];
  }
}
