import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';

import '../../helpers/init_hive.dart';

void main() {
  initHive();

  String token = 'token';

  group('unit test: getAnilistClient with existing token', () {
    late Box box;

    setUp(() async {
      box = await Hive.openBox(AnilistAuthBloc.boxName);
      box.put(AnilistAuthBloc.tokenKey, token);
    });

    test('Returns a client with the right token', () {
      final client = getAnilistClient();

      expect(client.link, isNotNull);
      expect(client.cache, isA<GraphQLCache>());
    });
  });

  group('unit test: getAnilistClient without existing token', () {
    test('Returns a client with the right token', () {
      final client = getAnilistClient();

      expect(client.link, isNotNull);
      expect(client.cache, isA<GraphQLCache>());
    });
  });
}
