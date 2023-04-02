import 'dart:async';

import 'package:anilist/anilist.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/helpers/logger.dart';
import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/helpers/anilist_client.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final repository = Anilist(client: getAnilistClient());

  final StateStreamableSource<AnilistAuthState> authBloc;

  WatchListBloc(this.authBloc) : super(const WatchListInitial(username: null)) {
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

    /// When pc is too good, the event arrives before this bloc is even
    /// created.
    if (authBloc.state is AnilistAuthSuccess) {
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
}
