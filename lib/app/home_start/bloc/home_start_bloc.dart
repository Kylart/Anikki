import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';

part 'home_start_event.dart';
part 'home_start_state.dart';

class HomeStartBloc extends Bloc<HomeStartEvent, HomeStartState> {
  final UserListRepository userListRepository;
  final FeedRepository feedRepository;

  HomeStartBloc({
    required this.userListRepository,
    required this.feedRepository,
  }) : super(HomeStartInitial()) {
    on<HomeStartRefresh>(_onRefresh);
  }

  Future<void> _onRefresh(
      HomeStartRefresh event, Emitter<HomeStartState> emit) async {
    try {
      emit(
        HomeStartLoading(
          entries: state.entries,
        ),
      );

      final entries = userListRepository.getStartList(event.watchList);

      if (entries.isEmpty) {
        final backupEntries = await feedRepository.getRecommandations();

        if (backupEntries.isNotEmpty) {
          emit(
            HomeStartLoaded(
              entries: entries,
            ),
          );
        }

        emit(const HomeStartEmpty());
      } else {
        emit(
          HomeStartLoaded(
            entries: entries,
          ),
        );
      }
    } on AnilistGetListException catch (e) {
      emit(
        HomeStartError(
          entries: state.entries,
          message: e.error ?? e.cause,
        ),
      );
    } catch (e) {
      emit(
        HomeStartError(
          entries: state.entries,
          message: e.toString(),
        ),
      );
    }
  }
}
