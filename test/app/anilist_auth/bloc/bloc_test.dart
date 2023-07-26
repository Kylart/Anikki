import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/user_repository.dart';

import '../../../fixtures/anilist.dart';
import '../../../helpers/init_hive.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  initHive();

  group('unit test: AnilistAuth Bloc', () {
    late AnilistAuthBloc bloc;
    late UserRepository repository;

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
        repository = UserRepositoryMock();

        when(() => repository.getCurrentUser())
            .thenAnswer((invocation) async => userMock);

        bloc = AnilistAuthBloc(repository);
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
        repository = UserRepositoryMock();

        when(() => repository.getCurrentUser())
            .thenThrow(AnilistNotConnectedException());

        bloc = AnilistAuthBloc(repository);
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
        repository = UserRepositoryMock();
        bloc = AnilistAuthBloc(repository);

        final box = await Hive.openBox(UserRepository.boxName);
        box.put(UserRepository.tokenKey, 'blabla');
      },
      verify: (bloc) async {
        final box = await Hive.openBox(UserRepository.boxName);
        expect(box.get(UserRepository.tokenKey), isNull);
      },
    );
  });
}
