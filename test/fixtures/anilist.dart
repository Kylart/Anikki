import 'package:anikki/core/core.dart';
import 'package:anikki/features/library/domain/domain.dart';
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

const username = 'Kylart';

final userMock = Query$Viewer$Viewer(name: username);

final viewerMock = Query$Viewer(
  Viewer: userMock,
);

final shortMediaMock = Fragment$shortMedia(
    id: 20,
    title: Fragment$shortMedia$title(
      userPreferred: 'Sakura Trick',
    ));

final localFileMock = LocalFile(
  path:
      'test\\resources\\movies\\[SubsPlease] Kaminaki Sekai no Kamisama Katsudou - 03 (1080p) [0328F445].mkv',
  media: Media(
    anilistInfo: shortMediaMock,
  ),
  episode: 3,
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

final watchListMock = Query$GetLists(
  MediaListCollection: Query$GetLists$MediaListCollection(
    lists: [
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.CURRENT,
          ),
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.CURRENT,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.COMPLETED,
          ),
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.COMPLETED,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.DROPPED,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.PLANNING,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.PAUSED,
          ),
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.PAUSED,
          ),
        ],
      ),
    ],
  ),
);

final watchListUpdateMock = Mutation$UpdateEntry(
  SaveMediaListEntry: Mutation$UpdateEntry$SaveMediaListEntry(id: 1),
);
