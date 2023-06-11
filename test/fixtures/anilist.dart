import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class MockAnilist extends Mock implements Anilist {}

class MockQueryManager extends Mock implements QueryManager {}

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryResult<T> extends Mock implements QueryResult<T> {}

class _FakeQueryOptions<T> extends Fake implements QueryOptions<T> {}

class _FakeMutationOptions<T> extends Fake implements MutationOptions<T> {}

MockGraphQLClient generateMockGraphQLClient() {
  final graphQLClient = MockGraphQLClient();
  final queryManager = MockQueryManager();

  when(() => graphQLClient.defaultPolicies).thenReturn(DefaultPolicies());
  when(() => graphQLClient.queryManager).thenReturn(queryManager);

  return graphQLClient;
}

MockQueryResult<T> generateMockQuery<T>(MockGraphQLClient graphQLClient) {
  registerFallbackValue(_FakeQueryOptions<T>());

  final result = MockQueryResult<T>();
  when(() => graphQLClient.query<T>(any())).thenAnswer((_) async => result);

  final queryManager = graphQLClient.queryManager;
  when(() => queryManager.query<T>(any())).thenAnswer((_) async => result);

  return result;
}

MockQueryResult<T> generateMockMutation<T>(MockGraphQLClient graphQLClient) {
  registerFallbackValue(_FakeMutationOptions<T>());

  final result = MockQueryResult<T>();
  when(() => graphQLClient.mutate<T>(any())).thenAnswer((_) async => result);

  final queryManager = graphQLClient.queryManager;
  when(() => queryManager.mutate<T>(any())).thenAnswer((_) async => result);

  return result;
}

final shortMediaMock = Fragment$shortMedia(
  id: 20,
);

final airingScheduleMock = Query$AiringSchedule(
  Page: Query$AiringSchedule$Page(
    pageInfo: Query$AiringSchedule$Page$pageInfo(
      hasNextPage: false,
      total: 1,
    ),
    airingSchedules: [
      Query$AiringSchedule$Page$airingSchedules(
        id: 1,
        episode: 4,
        airingAt: 0,
        media: Fragment$shortMedia(
          id: 20,
        ),
      ),
      Query$AiringSchedule$Page$airingSchedules(
        id: 2,
        episode: 5,
        airingAt: 0,
        media: Fragment$shortMedia(
          id: 21,
        ),
      ),
    ],
  ),
);
