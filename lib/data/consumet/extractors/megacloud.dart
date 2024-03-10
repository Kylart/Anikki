import 'dart:convert';
import 'dart:typed_data';

import 'package:anikki/data/consumet/utils/utils.dart';
import 'package:anikki/data/data.dart';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:http/http.dart';

const megacloud = (
  script: "https://megacloud.tv/js/player/a/prod/e1-player.min.js?v=",
  sources: "https://megacloud.tv/embed-2/ajax/e-1/getSources?id=",
);

class MegaCloud extends Extractor {
  final client = Client();
  final serverName = 'MegaCloud';

  @override
  Future<List<VideoSource>> extract(Uri uri) async {
    final videoId =
        uri.toString().split('/').lastOrNull?.split('?').firstOrNull;
    var res = await client
        .get(Uri.parse(megacloud.sources + (videoId ?? '')), headers: {
      'Accept': '*/*',
      'X-Requested-With': 'XMLHttpRequest',
      'User-Agent': userAgent,
      'Referer': uri.toString(),
    });

    final srcData = json.decode(res.body);

    final subtitles = (srcData['tracks'] as List)
        .mapIndexed(
          (index, s) => VideoSubtitle(
            url: s['file']!,
            id: s['label'],
            lang: s['label'] ?? 'Thumbnails',
            isDefault: s['label'] != null && index == 0,
          ),
        )
        .where((element) => element.lang != 'Thumbnails')
        .toList();

    final encryptedString = srcData['sources'];
    if (srcData['encrypted'] && encryptedString is List) {
      return encryptedString
          .map(
            (e) => VideoSource(
              url: e['file'],
              isM3U8: e['file'].toString().contains('.m3u8'),
              subtitles: subtitles,
            ),
          )
          .toList();
    }

    res = await client.get(
      Uri.parse(megacloud.script + DateTime.now().toString()),
    );

    final text = res.body;

    if (text.isEmpty) throw "Couldn't fetch script to decrypt resource";

    final vars = _extractVariables(text);
    final (secret, encryptedSource) = _getSecret(encryptedString, vars);
    final decrypted = _decrypt(encryptedSource, secret);

    final sources = json.decode(decrypted) as List;
    return sources
        .map(
          (e) => VideoSource(
            url: e['file'],
            isM3U8: e['file'].toString().contains('.m3u8'),
            subtitles: subtitles,
          ),
        )
        .toList();
  }

  List<int> _extractVariables(String text) {
    final match = RegExp(r"const \w{1,2}=new URLSearchParams.+?;(?=function)")
        .firstMatch(text);
    final allVars = match?[0];

    if (allVars == null) throw 'No variable found';

    return allVars
        .substring(0, allVars.length - 1)
        .split('=')
        .slice(1)
        .map((pair) => int.tryParse(pair.split(',').elementAt(0)))
        .whereType<int>()
        .toList();
  }

  (String secret, String encryptedSource) _getSecret(
    String encryptedString,
    List<int> values,
  ) {
    var secret = '';
    var encryptedSource = encryptedString;
    var totalInc = 0;

    for (int i = 0; i < values[0]; i++) {
      int? start, inc;

      switch (i) {
        case 0:
          start = values[2];
          inc = values[1];
          break;
        case 1:
          start = values[4];
          inc = values[3];
          break;
        case 2:
          start = values[6];
          inc = values[5];
          break;
        case 3:
          start = values[8];
          inc = values[7];
          break;
        case 4:
          start = values[10];
          inc = values[9];
          break;
        case 5:
          start = values[12];
          inc = values[11];
          break;
        case 6:
          start = values[14];
          inc = values[13];
          break;
        case 7:
          start = values[16];
          inc = values[15];
          break;
        case 8:
          start = values[18];
          inc = values[17];
          break;
      }

      final from = start! + totalInc;
      final to = from + inc!;

      secret += encryptedString.substring(from, to);
      encryptedSource = encryptedSource.replaceFirst(
        encryptedString.substring(from, to),
        '',
      );
      totalInc += inc;
    }

    return (
      secret,
      encryptedSource,
    );
  }

  String _decrypt(String encrypted, String keyOrSecret) {
    late Uint8List key;
    late Uint8List iv;
    late Uint8List contents;

    final cypher = base64.decode(encrypted);
    final salt = cypher.sublist(8, 16);
    final password = List<int>.from(utf8.encode(keyOrSecret)) + salt;

    final md5Hashes = <List<int>>[];
    var digest = Uint8List.fromList(password);
    for (int i = 0; i < 3; i++) {
      md5Hashes.add(md5.convert(digest).bytes);
      digest = Uint8List.fromList([...md5Hashes[i], ...password]);
    }
    key = Uint8List.fromList([...md5Hashes[0], ...md5Hashes[1]]);
    iv = Uint8List.fromList(md5Hashes[2]);
    contents = cypher.sublist(16);

    final encrypter = Encrypter(
      AES(
        Key(key),
        mode: AESMode.cbc,
      ),
    );

    final decrypted = encrypter.decrypt(
      Encrypted(contents),
      iv: IV(iv),
    );

    return decrypted;
  }
}
