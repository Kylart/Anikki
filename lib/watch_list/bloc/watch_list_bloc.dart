import 'package:anilist/anilist.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/helpers/anilist_client.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final repository = Anilist(client: getAnilistClient());

  WatchListBloc() : super(const WatchListInitial(username: null)) {
    on<WatchListRequested>(_onRequested);
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
