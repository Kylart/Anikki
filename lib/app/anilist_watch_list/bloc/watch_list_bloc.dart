import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends AutoRefreshBloc<WatchListEvent, WatchListState> {
  final UserListRepository repository;

  WatchListBloc(
    this.repository,
  ) : super(const WatchListInitial(username: null)) {
    on<WatchListRequested>(_onRequested);
    on<WatchListReset>(_onReset);
    on<WatchListWatched>(_onWatched);
    on<WatchListAuthUpdated>(_onAuthUpdated);

    setUpAutoRefresh();
  }

  @override
  void autoRefresh() {
    if (state.username != null) {
      add(WatchListRequested(username: state.username!));
    }
  }

  void _onAuthUpdated(
      WatchListAuthUpdated event, Emitter<WatchListState> emit) {
    if (event.connected) {
      add(WatchListRequested(username: event.username!));
    } else {
      add(WatchListReset());
    }
  }

  void _onReset(WatchListReset event, Emitter<WatchListState> emit) {
    emit(const WatchListInitial(
      username: null,
      connected: false,
    ));
  }

  Future<void> _onRequested(
      WatchListRequested event, Emitter<WatchListState> emit) async {
    final username = event.username;

    emit(
      WatchListLoading(
        username: username,
        watchList: state.watchList,
      ),
    );

    try {
      final watchList = await repository.getList(
        username,
      );

      emit(
        WatchListComplete(
          username: username,
          watchList: watchList,
          connected: true,
        ),
      );
    } on AnilistGetListException catch (e) {
      emit(
        WatchListError(
          username: username,
          watchList: state.watchList,
          message: e.error ?? 'Something went wrong...',
          connected: state.connected,
        ),
      );
    } catch (e) {
      emit(
        WatchListError(
          username: username,
          message: e.toString(),
          watchList: state.watchList,
          connected: state.connected,
        ),
      );
    }
  }

  Future<void> _onWatched(
      WatchListWatched event, Emitter<WatchListState> emit) async {
    if (!state.connected) return;

    final entry = event.entry;
    final media = event.media ?? entry!.media!;
    final episode = event.episode ?? entry?.episode ?? 1;

    if (entry?.media?.anilistInfo.id == null && event.media == null) return;

    final currentState = state;

    try {
      await repository.watchedEntry(
        episode: episode,
        media: media,
      );

      emit(
        WatchListNotify(
          username: state.username,
          title: 'Anilist list updated!',
          description: 'Updated ${media.title} with episode $episode.',
        ),
      );
      emit(currentState);

      add(
        WatchListRequested(
          username: state.username!,
        ),
      );
    } on AnilistUpdateListException catch (e) {
      logger.error('Could not update anilsit list', e);

      emit(
        WatchListNotify(
            username: state.username,
            title: 'Could not update Anilist list',
            description: 'Anikki will retry periodically until it succeeds.',
            isError: true),
      );
      emit(currentState);

      Timer(
        const Duration(minutes: 5),
        () => add(event),
      );
    }
  }
}
