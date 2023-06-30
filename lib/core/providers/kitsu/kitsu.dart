import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:anikki/core/providers/kitsu/exceptions/kitsu_search_exception.dart';
import 'package:anikki/core/providers/kitsu/models/kitsu_search_result/attributes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import 'package:anikki/core/providers/kitsu/models/models.dart';
import 'package:path/path.dart';

class KitsuClient {
  const KitsuClient({required this.client});

  final Client client;

  final baseUrl = 'https://kitsu.io/api/edge';

  String getUrl(String path) => '$baseUrl$path';
  Uri getUri(String path) => Uri.parse(getUrl(path));
}

class Kitsu extends KitsuClient {
  Kitsu({
    required super.client,
  });

  static const boxName = 'anikki.kitsu';
  Box? box;

  Future<String> _get(
    String path, [
    Map<String, String> parameters = const {},
  ]) async {
    box ??= await Hive.openBox(boxName);

    try {
      final uri = getUri(path).replace(
        queryParameters: parameters,
      );

      final key = hash(uri.toString());
      final storedResponse = box?.get(key);

      if (storedResponse != null) {
        return storedResponse.toString();
      }

      final response = await client.get(uri);

      switch (response.statusCode) {
        case 200:
          final result = utf8.decode(response.bodyBytes);

          box?.put(key, result);
          Timer(
            const Duration(minutes: 5),
            () {
              box?.delete(key);
            },
          );

          return result;

        default:
          throw HttpException('${response.statusCode}');
      }
    } on HttpException catch (e) {
      throw KitsuSearchException(e);
    }
  }

  Future<List<KitsuMedia>> search(
    String term, {
    int limit = 5,
    int offset = 0,
    List<KitsuMedia> previousResults = const [],
  }) async {
    const maxLimit = 20;
    final response = await _get(
      '/anime',
      {
        'filter[text]': term,
        'page[limit]': (limit > maxLimit ? maxLimit : limit).toString(),
        'page[offset]': offset.toString(),
      },
    );

    final searchResult = KitsuSearchResult.fromJson(response);

    if (searchResult.data == null) throw const KitsuSearchException();

    final result = [
      ...previousResults,
      ...searchResult.data!,
    ];

    if (limit > maxLimit) {
      return await search(
        term,
        limit: limit - maxLimit,
        offset: offset + 1,
        previousResults: result,
      );
    }

    return previousResults;
  }

  Future<List<KitsuEpisode>> episodes(String id) async {
    final rawResults = await _get('/anime/$id/episodes');
    final result = KitsuSearchResult.fromJson(rawResults);

    if (result.data == null) throw const KitsuSearchException();

    return result.data!
        .map((e) => e.attributes)
        .whereType<Attributes>()
        .map((e) => KitsuEpisode.fromJson(e.toJson()))
        .toList();
  }
}
