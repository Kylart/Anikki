import 'package:anikki/data/data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/domain/domain.dart';

part 'home_continue_event.dart';
part 'home_continue_state.dart';

class HomeContinueBloc extends Bloc<HomeContinueEvent, HomeContinueState> {
  final UserListRepository repository;

  HomeContinueBloc(this.repository) : super(HomeContinueInitial()) {
    on<HomeContinueEvent>((event, emit) {
      logger.v('HomeContinueEvent: ${event.runtimeType}');
    });

    on<HomeContinueRefresh>(_onRefresh);
  }

  Future<void> _onRefresh(
      HomeContinueRefresh event, Emitter<HomeContinueState> emit) async {
    try {
      emit(
        HomeContinueLoading(entries: state.entries),
      );

      final entries = await repository.getContinueList(event.username);

      emit(
        HomeContinueLoaded(entries: entries),
      );
    } on AnilistGetListException catch (e) {
      emit(
        HomeContinueError(
          entries: state.entries,
          message: e.error ?? e.cause,
        ),
      );
    } catch (e) {
      emit(
        HomeContinueError(
          entries: state.entries,
          message: e.toString(),
        ),
      );
    }
  }
}
