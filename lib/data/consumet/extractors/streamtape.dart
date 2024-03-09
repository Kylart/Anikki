import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:anikki/data/data.dart';

class StreamTape extends Extractor {
  final serverName = 'StreamTape';
  final client = Client();

  @override
  Future<List<VideoSource>> extract(Uri uri) async {
    final res = await client.get(uri);
    final document = parse(res.body);

    final match = RegExp(r"robotlink'\).innerHTML = (.*)'")
        .firstMatch(document.outerHtml);

    if (match == null) throw 'Could not find robotlink';

    final fhsh = match.group(1)?.split("+ ('");

    var fh = fhsh?[0];
    var sh = fhsh?[1].substring(3);

    fh = fh?.replaceAll("'", '');

    final url = 'https:$fh$sh';

    return [
      VideoSource(
        url: url,
        isM3U8: url.contains('.m3u8'),
      ),
    ];
  }
}
