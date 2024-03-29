import 'package:anikki/data/data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

part 'home_continue_event.dart';
part 'home_continue_state.dart';

class HomeContinueBloc
    extends AutoRefreshBloc<HomeContinueEvent, HomeContinueState> {
  final UserListRepository repository;

  HomeContinueBloc(this.repository) : super(HomeContinueInitial()) {
    on<HomeContinueRefresh>(_onRefresh);

    setUpAutoRefresh();
  }

  @override
  void autoRefresh() async {
    add(HomeContinueRefresh(state.username));
  }

  Future<void> _onRefresh(
      HomeContinueRefresh event, Emitter<HomeContinueState> emit) async {
    try {
      emit(
        HomeContinueLoading(
          entries: state.entries,
          username: event.username,
        ),
      );

      final entries = await repository.getContinueList(event.username);

      emit(
        HomeContinueLoaded(
          entries: entries,
          username: event.username,
        ),
      );
    } on AnilistGetListException catch (e) {
      emit(
        HomeContinueError(
          entries: state.entries,
          username: event.username,
          message: e.error ?? e.cause,
        ),
      );
    } catch (e) {
      emit(
        HomeContinueError(
          entries: state.entries,
          username: event.username,
          message: e.toString(),
        ),
      );
    }
  }
}
