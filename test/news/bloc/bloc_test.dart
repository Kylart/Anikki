import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/news/bloc/news_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/news_repository.dart';

import '../../fixtures/anilist.dart';

class NewsRepositoryMock extends Mock implements NewsRepository {}

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  final mockEntries = airingScheduleMock.Page!.airingSchedules!
      .whereType<Query$AiringSchedule$Page$airingSchedules>()
      .map((e) => NewsEntry.fromAnilistSchedule(e))
      .toList();

  group('unit test: News Bloc', () {
    late NewsBloc bloc;
    late NewsRepositoryMock repository;

    test('has an interval running', () {
      repository = NewsRepositoryMock();
      bloc = NewsBloc(repository);

      expect(bloc.interval, isNotNull);
      expect(bloc.interval?.isActive, isTrue);
    });

    blocTest(
      'emits [NewsLoading, NewsComplete] when [NewsRequested] is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        NewsRequested(
          range: NewsBloc.initalDateRange,
        ),
      ),
      expect: () => [
        NewsLoading(range: NewsBloc.initalDateRange),
        isA<NewsComplete>()
            .having(
              (p0) => p0.entries.length,
              'with the right amount of entries',
              airingScheduleMock.Page?.airingSchedules?.length,
            )
            .having(
              (p0) => p0.range,
              'has right range',
              NewsBloc.initalDateRange,
            ),
      ],
      setUp: () {
        repository = NewsRepositoryMock();
        when(() => repository.getSchedule(NewsBloc.initalDateRange))
            .thenAnswer((_) async => mockEntries);

        bloc = NewsBloc(repository);
      },
    );

    blocTest(
      'emits [NewsLoading, NewsError] when [NewsRequested] is added but fails',
      build: () => bloc,
      act: (bloc) => bloc.add(
        NewsRequested(
          range: NewsBloc.initalDateRange,
        ),
      ),
      expect: () => [
        NewsLoading(range: NewsBloc.initalDateRange),
        isA<NewsError>().having(
          (p0) => p0.range,
          'has right range',
          NewsBloc.initalDateRange,
        ),
      ],
      setUp: () {
        repository = NewsRepositoryMock();
        when(() => repository.getSchedule(NewsBloc.initalDateRange))
            .thenThrow(AnilistGetScheduleException(error: 'error'));

        bloc = NewsBloc(repository);
      },
    );
  });
}
