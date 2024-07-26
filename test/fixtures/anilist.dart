import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

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

final userMock = Query$Viewer$Viewer(name: username, id: 0);

final viewerMock = Query$Viewer(
  Viewer: userMock,
);

final shortMediaMock = Fragment$shortMedia(
  id: 20,
  episodes: 12,
  title: Fragment$shortMedia$title(
    userPreferred: 'Sakura Trick',
  ),
);

final localFileMock = LocalFile(
  path:
      'test\\resources\\movies\\[SubsPlease] Kaminaki Sekai no Kamisama Katsudou - 03 (1080p) [0328F445].mkv',
  media: Media(
    anilistInfo: shortMediaMock,
  ),
  episode: 3,
);

final anilistMediaMock = Media(anilistInfo: shortMediaMock);

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
            media: Fragment$shortMedia(
              id: 1,
              episodes: 12,
              isAdult: false,
              nextAiringEpisode: Fragment$shortMedia$nextAiringEpisode(
                airingAt: 1,
                episode: 3,
              ),
            ),
            progress: 2,
          ),
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.CURRENT,
            media: Fragment$shortMedia(
              id: 2,
              episodes: 12,
              isAdult: false,
              nextAiringEpisode: Fragment$shortMedia$nextAiringEpisode(
                airingAt: 1,
                episode: 6,
              ),
            ),
            progress: 4,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.COMPLETED,
            media: Fragment$shortMedia(id: 3, episodes: 12, isAdult: false),
            progress: 12,
          ),
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.COMPLETED,
            media: Fragment$shortMedia(id: 4, episodes: 12, isAdult: false),
            progress: 12,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.DROPPED,
            media: Fragment$shortMedia(id: 5, episodes: 12, isAdult: false),
            progress: 3,
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.PLANNING,
            media: Fragment$shortMedia(id: 6, episodes: 12, isAdult: false),
          ),
        ],
      ),
      Query$GetLists$MediaListCollection$lists(
        entries: [
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.PAUSED,
            media: Fragment$shortMedia(id: 7, episodes: 12, isAdult: false),
            progress: 6,
          ),
          Query$GetLists$MediaListCollection$lists$entries(
            status: Enum$MediaListStatus.PAUSED,
            media: Fragment$shortMedia(id: 8, episodes: 12, isAdult: false),
            progress: 7,
          ),
        ],
      ),
    ],
  ),
);

final completedEntriesMock = watchListMock.MediaListCollection?.lists
        ?.firstWhere(
          (element) =>
              element?.entries?.first?.status == Enum$MediaListStatus.COMPLETED,
        )
        ?.entries
        ?.whereType<Query$GetLists$MediaListCollection$lists$entries>()
        .toList() ??
    [];
final plannedEntriesMock = watchListMock.MediaListCollection?.lists
        ?.firstWhere(
          (element) =>
              element?.entries?.first?.status == Enum$MediaListStatus.PLANNING,
        )
        ?.entries
        ?.whereType<Query$GetLists$MediaListCollection$lists$entries>()
        .toList() ??
    [];
final currentEntriesMock = watchListMock.MediaListCollection?.lists
        ?.firstWhere(
          (element) =>
              element?.entries?.first?.status == Enum$MediaListStatus.CURRENT,
        )
        ?.entries
        ?.whereType<Query$GetLists$MediaListCollection$lists$entries>()
        .toList() ??
    [];
final droppedEntriesMock = watchListMock.MediaListCollection?.lists
        ?.firstWhere(
          (element) =>
              element?.entries?.first?.status == Enum$MediaListStatus.DROPPED,
        )
        ?.entries
        ?.whereType<Query$GetLists$MediaListCollection$lists$entries>()
        .toList() ??
    [];
final pausedEntriesMock = watchListMock.MediaListCollection?.lists
        ?.firstWhere(
          (element) =>
              element?.entries?.first?.status == Enum$MediaListStatus.PAUSED,
        )
        ?.entries
        ?.whereType<Query$GetLists$MediaListCollection$lists$entries>()
        .toList() ??
    [];

final watchListClassMock = AnilistWatchList(
  completed: completedEntriesMock,
  current: currentEntriesMock,
  dropped: droppedEntriesMock,
  planning: plannedEntriesMock,
  paused: pausedEntriesMock,
  repeating: const [],
);

final watchListUpdateMock = Mutation$UpdateEntry(
  SaveMediaListEntry: Mutation$UpdateEntry$SaveMediaListEntry(id: 1),
);

final characterMock = Query$Search$characters$results(
  id: 0,
  name: Query$Search$characters$results$name(full: 'Hestia'),
);

final staffMock = Query$Search$staff$results(
  id: 0,
  name: Query$Search$staff$results$name(full: 'Minase Inori'),
);

final searchResultMock = {
  AnilistSearchPart.animes: List<Fragment$shortMedia>.from([shortMediaMock]),
  AnilistSearchPart.characters:
      List<Query$Search$characters$results>.from([characterMock]),
  AnilistSearchPart.staffs: List<Query$Search$staff$results>.from([staffMock]),
};
