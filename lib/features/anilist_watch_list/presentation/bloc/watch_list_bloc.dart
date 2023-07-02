import 'dart:async';

import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:anikki/features/library/domain/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/helpers/logger.dart';
import 'package:flutter/material.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final Anilist repository;

  WatchListBloc(
    this.repository,
  ) : super(const WatchListInitial(username: null)) {
    on<WatchListEvent>((event, emit) {
      logger.v('WatchList event: ${event.runtimeType}');
    });

    on<WatchListRequested>(_onRequested);
    on<WatchListReset>(_onReset);
    on<WatchListWatched>(_onWatched);
    on<WatchListAuthUpdated>(_onAuthUpdated);
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

    emit(WatchListLoading(username: username));

    try {
      final watchList = await repository.getWatchLists(
        username,
        useCache: false,
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
          message: e.error ?? 'Something went wrong...',
          connected: state.connected,
        ),
      );
    } catch (e) {
      emit(
        WatchListError(
          username: username,
          message: e.toString(),
          connected: state.connected,
        ),
      );
    }
  }

  Future<void> _onWatched(
      WatchListWatched event, Emitter<WatchListState> emit) async {
    if (!state.connected) return;

    final entry = event.entry;

    if (entry.media?.anilistInfo.id != null) {
      final episode = entry.episode ?? 1;

      try {
        await repository.watchedEntry(
          episode: episode,
          mediaId: entry.media!.anilistInfo.id,
          status: episode == 1 && entry.media?.anilistInfo.episodes != 1
              ? Enum$MediaListStatus.CURRENT
              : null,
        );

        event.scaffold.showSnackBar(
          SnackBar(
            content: ListTile(
              title: const Text('Anilist list updated!'),
              subtitle:
                  Text('Updated ${entry.media?.title} with episode $episode.'),
            ),
          ),
        );

        add(
          WatchListRequested(
            username: state.username!,
          ),
        );
      } on AnilistUpdateListException catch (e) {
        event.scaffold.showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: ListTile(
              title: Text(e.cause),
              subtitle: Text('Error was ${e.error}.'),
            ),
          ),
        );
      }
    }
  }
}
