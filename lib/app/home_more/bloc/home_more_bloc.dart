import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/feed_repository.dart';

part 'home_more_event.dart';
part 'home_more_state.dart';

class HomeMoreBloc extends Bloc<HomeMoreEvent, HomeMoreState> {
  final FeedRepository repository;

  HomeMoreBloc(this.repository) : super(HomeMoreInitial()) {
    on<HomeMoreEvent>((event, emit) {
      logger.v('HomeMoreEvent: ${event.runtimeType}');
    });

    on<HomeMoreRefresh>(_onRefresh);
  }

  Future<void> _onRefresh(
      HomeMoreRefresh event, Emitter<HomeMoreState> emit) async {
    try {
      emit(HomeMoreLoading(
        entries: state.entries,
      ));

      final entries = await repository.getRecommandations();

      emit(
        HomeMoreLoaded(
          entries: entries,
        ),
      );
    } on AnilistGetTrendingException catch (e) {
      emit(
        HomeMoreFailed(
          message: e.cause,
          entries: state.entries,
        ),
      );
    } catch (e) {
      emit(
        HomeMoreFailed(
          message: e.toString(),
          entries: state.entries,
        ),
      );
    }
  }
}
