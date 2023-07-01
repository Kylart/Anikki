import 'dart:async';

import 'package:anikki/core/providers/anilist/anilist.dart';
import 'package:anikki/features/library/domain/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/helpers/logger.dart';
import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';
import 'package:flutter/material.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final Anilist repository;

  final StateStreamableSource<AnilistAuthState> authBloc;

  bool get isConnected => authBloc.state is AnilistAuthSuccess;

  WatchListBloc({
    required this.repository,
    required this.authBloc,
  }) : super(const WatchListInitial(username: null)) {
    authBloc.stream.listen((state) {
      if (state is AnilistAuthSuccess) {
        add(WatchListRequested(username: state.me.name));
      } else {
        add(WatchListReset());
      }
    });

    on<WatchListEvent>((event, emit) {
      logger.v('WatchList event: ${event.runtimeType}');
    });

    on<WatchListRequested>(_onRequested);
    on<WatchListReset>(_onReset);
    on<WatchListWatched>(_onUpdateEntry);

    if (isConnected) {
      add(WatchListRequested(
          username: (authBloc.state as AnilistAuthSuccess).me.name));
    }
  }

  void _onReset(WatchListReset event, Emitter<WatchListState> emit) {
    emit(const WatchListInitial(username: null));
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

      emit(WatchListComplete(username: username, watchList: watchList));
    } on AnilistGetListException catch (e) {
      emit(WatchListError(
          username: username, message: e.error ?? 'Something went wrong...'));
    } catch (e) {
      emit(WatchListError(username: username, message: e.toString()));
    }
  }

  Future<void> _onUpdateEntry(
      WatchListWatched event, Emitter<WatchListState> emit) async {
    if (!isConnected) return;

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
            username: (authBloc.state as AnilistAuthSuccess).me.name,
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
