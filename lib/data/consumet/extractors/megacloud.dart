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
    if (!srcData['encrypted'] && encryptedString is List) {
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

  String _matchingKey(String value, String script) {
    final regex = RegExp(',$value=((?:0x)?([0-9a-fA-F]+))');
    final match = regex.firstMatch(script);
    if (match != null) {
      return match.group(1)!.replaceFirst(RegExp(r'^0x'), '');
    } else {
      throw Exception('Failed to match the key');
    }
  }

  List<List<int>> _extractVariables(String text) {
    final regex = RegExp(
        r"case\s*0x[0-9a-f]+:(?![^;]*=partKey)\s*\w+\s*=\s*(\w+)\s*,\s*\w+\s*=\s*(\w+);");
    final matches = regex.allMatches(text);

    final vars = matches
        .map((match) {
          final matchKey1 = _matchingKey(match.group(1)!, text);
          final matchKey2 = _matchingKey(match.group(2)!, text);

          try {
            return [
              int.parse(matchKey1, radix: 16),
              int.parse(matchKey2, radix: 16)
            ];
          } catch (e) {
            return <int>[];
          }
        })
        .where((pair) => pair.isNotEmpty)
        .toList();

    return vars;
  }

  (String secret, String encryptedSource) _getSecret(
    String encryptedString,
    List<List<int>> values,
  ) {
    String secret = "";
    String encryptedSource = "";
    List<String> encryptedSourceArray = encryptedString.split("");
    int currentIndex = 0;

    for (List<int> index in values) {
      int start = index[0] + currentIndex;
      int end = start + index[1];

      for (int i = start; i < end; i++) {
        secret += encryptedString[i];
        encryptedSourceArray[i] = "";
      }
      currentIndex += index[1];
    }

    encryptedSource = encryptedSourceArray.join("");

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
