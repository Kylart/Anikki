import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserListRepository userListRepository;
  final FeedRepository feedRepository;

  HomeBloc({
    required this.userListRepository,
    required this.feedRepository,
  }) : super(HomeInitial()) {
    on<HomeCurrentMediaChanged>((event, emit) {
      emit(
        state.copyWith(
          currentMedia: event.entry?.media,
        ),
      );
    });

    on<HomeCurrentBackgroundUrlChanged>((event, emit) {
      emit(
        state.copyWith(
          currentBackgroundUrl: event.url,
        ),
      );
    });

    on<HomeRefreshed>(_onRefresh);
  }

  Future<void> _onRefresh(HomeRefreshed event, Emitter<HomeState> emit) async {
    List<MediaListEntry>? entries;
    var requestedType = event.requestedType ?? state.type;

    try {
      emit(
        HomeLoading(
          entries: state.entries,
          currentMedia: state.currentMedia,
          currentBackgroundUrl: state.currentBackgroundUrl,
          type: requestedType,
        ),
      );

      if ([
            HomeMediaType.following,
            HomeMediaType.toStart,
          ].contains(requestedType) &&
          event.watchList?.isEmpty == true) {
        requestedType = HomeMediaType.trending;
      }

      entries = switch (requestedType) {
        HomeMediaType.following =>
          await userListRepository.getContinueList(event.watchList!),
        HomeMediaType.toStart =>
          await userListRepository.getStartList(event.watchList!),
        HomeMediaType.trending => (await feedRepository.getTrending())
            .map(
              (media) => MediaListEntry(media: media, progress: null),
            )
            .toList(),
        HomeMediaType.recommendations =>
          (await feedRepository.getrecommendations())
              .map(
                (media) => MediaListEntry(media: media, progress: null),
              )
              .toList(),
      };

      emit(
        HomeLoaded(
          entries: entries,
          currentMedia: state.currentMedia,
          currentBackgroundUrl: state.currentBackgroundUrl,
          type: requestedType,
        ),
      );
    } on AnilistGetListException catch (e) {
      emit(
        HomeError(
          entries: state.entries,
          currentMedia: state.currentMedia,
          currentBackgroundUrl: state.currentBackgroundUrl,
          type: state.type,
          message: e.error ?? e.cause,
        ),
      );
    } on AnilistGetTrendingException catch (e) {
      emit(
        HomeError(
          entries: entries ?? state.entries,
          currentBackgroundUrl: state.currentBackgroundUrl,
          currentMedia: state.currentMedia,
          type: state.type,
          message: e.error ?? e.cause,
        ),
      );
    } catch (e) {
      emit(
        HomeError(
          entries: entries ?? state.entries,
          currentBackgroundUrl: state.currentBackgroundUrl,
          currentMedia: state.currentMedia,
          type: state.type,
          message: e.toString(),
        ),
      );
    }
  }
}
