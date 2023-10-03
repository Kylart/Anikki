import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

import '../models/models.dart';

class CDNKeys {
  CDNKeys({
    required this.key,
    required this.secondKey,
    required this.iv,
  });

  final Key key;
  final Key secondKey;
  final IV iv;
}

/// Adapted from `https://github.com/consumet/consumet.ts/blob/master/src/extractors/gogocdn.ts`
class GogoCDN extends Extractor {
  final client = Client();
  final serverName = 'goload';

  final _keys = CDNKeys(
    key: Key.fromUtf8('37911490979715163134003223491201'),
    secondKey: Key.fromUtf8('54674138327930866480207815084989'),
    iv: IV.fromUtf8('3134003223491201'),
  );

  var referrer = '';

  @override
  Future<List<VideoSource>> extract(Uri uri) async {
    referrer = uri.toString();

    final List<VideoSource> results = [];

    final page = await client.get(uri);
    final document = parse(page.body);

    final encyptedParams =
        _generateEncryptedAjaxParams(document, uri.queryParameters['id'] ?? '');

    final encryptedData = await client.get(
      Uri(
        scheme: uri.scheme,
        host: uri.host,
        path: 'encrypt-ajax.php',
        query: encyptedParams,
      ),
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
      },
    );

    final decryptedData = _decryptAjaxData(
      json.decode(encryptedData.body)['data'],
    );
    if (decryptedData['source'] == null) throw NoEpisodeSourceException;

    final String? url = decryptedData['source'][0]['file'];

    if (url?.contains('.m3u8') == true) {
      final resResult = await client.get(Uri.parse(url!));
      final regexp = RegExp(r'(RESOLUTION=)(.*)(\s*?)(\s*.*)');
      final resolutions = regexp.allMatches(resResult.body);
      final baseUrl = url.substring(0, url.lastIndexOf('/'));

      for (final resolution in resolutions) {
        final res = resolution[0] as String;

        results.add(
          VideoSource(
            url: '$baseUrl/${res.split('\n')[1]}',
            isM3U8: (baseUrl + res.split('\n')[1]).contains('.m3u8'),
            quality: '${res.split('\n')[0].split('x')[1].split(',')[0]}p',
          ),
        );
      }

      decryptedData['source'].forEach((dynamic source) {
        results.add(
          VideoSource(
            url: url,
            isM3U8: source['file'].contains('.m3u8'),
            quality: 'default',
          ),
        );
      });
    } else {
      decryptedData['source'].forEach((dynamic source) {
        results.add(
          VideoSource(
            url: source['file'],
            isM3U8: source['file'].contains('.m3u8'),
            quality: source.label.split(' ')[0] + 'p',
          ),
        );
      });
    }

    decryptedData['source_bk'].forEach((dynamic source) {
      results.add(
        VideoSource(
          url: source['file'],
          isM3U8: source['file'].contains('.m3u8'),
          quality: 'backup',
        ),
      );
    });

    return results;
  }

  String _generateEncryptedAjaxParams(
    Document document,
    String id,
  ) {
    final encrypter = Encrypter(
      AES(
        _keys.key,
        mode: AESMode.cbc,
      ),
    );

    final encryptedKey = encrypter.encrypt(
      id,
      iv: _keys.iv,
    );

    final scriptValue = document
        .querySelector("script[data-name='episode']")
        ?.attributes["data-value"];

    if (scriptValue == null) throw NoEpisodeSourceException;

    final decryptedToken = encrypter.decrypt(
      Encrypted.from64(scriptValue),
      iv: _keys.iv,
    );

    return 'id=${encryptedKey.base64}&alias=$decryptedToken';
  }

  Map<String, dynamic> _decryptAjaxData(String encryptedData) {
    final encrypter = Encrypter(
      AES(
        _keys.secondKey,
        mode: AESMode.cbc,
      ),
    );

    final decryptedData = encrypter.decrypt(
      Encrypted.from64(encryptedData),
      iv: _keys.iv,
    );

    return json.decode(decryptedData);
  }
}
