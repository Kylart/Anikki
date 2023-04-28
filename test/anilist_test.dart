import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures/anilist.dart';

void main() {
  late MockGraphQLClient mockGraphQLClient;

  setUp(() {
    mockGraphQLClient = generateMockGraphQLClient();
  });

  group('unit test: Anilist', () {
    group('[getSchedule] method', () {
      test('gets a news schedule if no error occurs', () async {
        final result =
            generateMockQuery<Query$AiringSchedule>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(false);
        when(() => result.parsedData).thenReturn(airingScheduleMock);

        final anilist = Anilist(client: mockGraphQLClient);
        final schedule = await anilist.getSchedule(
            DateTimeRange(start: DateTime.now(), end: DateTime.now()));

        expect(
          schedule.length,
          airingScheduleMock.Page?.airingSchedules?.length,
        );
      });

      test('throws an error if rquery fails ', () async {
        final result =
            generateMockQuery<Query$AiringSchedule>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(true);
        when(() => result.exception).thenReturn(OperationException());

        final anilist = Anilist(client: mockGraphQLClient);

        try {
          await anilist.getSchedule(
              DateTimeRange(start: DateTime.now(), end: DateTime.now()));

          fail('Error was not thrown');
        } catch (e) {
          expect(e, isA<AnilistGetScheduleException>());
        }
      });
    });

    group('[search] method', () {
      test('gets information if no error occurs', () async {
        final result = generateMockQuery<Query$Search>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(false);
        when(() => result.parsedData).thenReturn(
          Query$Search(
            anime: Query$Search$anime(
              results: [
                shortMediaMock,
              ],
            ),
            characters: Query$Search$characters(
              results: [
                Query$Search$characters$results(id: 1),
              ],
            ),
          ),
        );

        final anilist = Anilist(client: mockGraphQLClient);
        final search = await anilist.search('Hello');

        expect(
          search[AnilistSearchPart.animes]?.length,
          1,
        );
        expect(
          search[AnilistSearchPart.characters]?.length,
          1,
        );
        expect(
          search[AnilistSearchPart.staffs]?.length,
          0,
        );
      });

      test('throws an error if query fails ', () async {
        final result = generateMockQuery<Query$Search>(mockGraphQLClient);
        when(() => result.hasException).thenReturn(true);
        when(() => result.parsedData).thenReturn(null);
        when(() => result.exception).thenReturn(
          OperationException(
            graphqlErrors: [
              const GraphQLError(message: 'Some error'),
            ],
          ),
        );

        final anilist = Anilist(client: mockGraphQLClient);

        try {
          await anilist.search('Hello');

          fail('Error was not thrown');
        } catch (e) {
          expect(e, isA<AnilistSearchException>());
        }
      });
    });
  });
}
