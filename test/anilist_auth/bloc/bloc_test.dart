import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/app/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';

import '../../fixtures/anilist.dart';
import '../../helpers/init_hive.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  initHive();

  group('unit test: AnilistAuth Bloc', () {
    late MockGraphQLClient mockGraphQLClient;
    late AnilistAuthBloc bloc;
    late Anilist repository;

    blocTest(
      'emits [AnilistAuthSuccess] when [AnilistAuthLoginRequested] is added and succeeds',
      build: () => bloc,
      act: (bloc) => bloc.add(
        AnilistAuthLoginRequested(),
      ),
      expect: () => [
        AnilistAuthSuccess(userMock),
      ],
      setUp: () {
        mockGraphQLClient = generateMockGraphQLClient();

        final result = generateMockQuery<Query$Viewer>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(false);
        when(() => result.parsedData).thenReturn(viewerMock);

        repository = Anilist(client: mockGraphQLClient);
        bloc = AnilistAuthBloc(
          repository,
        );
      },
    );

    blocTest(
      'emits [AnilistAuthError] when [AnilistAuthLoginRequested] is added but fails',
      build: () => bloc,
      act: (bloc) => bloc.add(
        AnilistAuthLoginRequested(),
      ),
      expect: () => [
        AnilistAuthError(AnilistNotConnectedException().cause),
      ],
      setUp: () {
        mockGraphQLClient = generateMockGraphQLClient();

        final result = generateMockQuery<Query$Viewer>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(true);
        when(() => result.exception).thenReturn(OperationException());

        repository = Anilist(client: mockGraphQLClient);
        bloc = AnilistAuthBloc(
          repository,
        );
      },
    );

    blocTest(
      'emits [AnilistAuthLoggedOut] when [AnilistAuthLogoutRequested] is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        AnilistAuthLogoutRequested(),
      ),
      expect: () => [
        AnilistAuthLoggedOut(),
      ],
      setUp: () async {
        mockGraphQLClient = generateMockGraphQLClient();

        repository = Anilist(client: mockGraphQLClient);
        bloc = AnilistAuthBloc(
          repository,
        );

        final box = await Hive.openBox(AnilistAuthBloc.boxName);
        box.put(AnilistAuthBloc.tokenKey, 'blabla');
      },
      verify: (bloc) async {
        final box = await Hive.openBox(AnilistAuthBloc.boxName);
        expect(box.get(AnilistAuthBloc.tokenKey), isNull);
      },
    );
  });
}
