import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserListRepository userListRepository;
  final FeedRepository feedRepository;

  HomeBloc({
    required this.userListRepository,
    required this.feedRepository,
  }) : super(const HomeState()) {
    on<HomeCurrentMediaChanged>((event, emit) {
      emit(
        state.copyWith(
          currentMedia: event.media,
        ),
      );
    });

    on<HomeRefreshed>(_onRefresh);
  }

  Future<void> _onRefresh(HomeRefreshed event, Emitter<HomeState> emit) async {
    List<Media>? medias;
    List<MediaListEntry>? entries;

    try {
      emit(
        HomeLoading(
          entries: state.entries,
          medias: state.medias,
        ),
      );

      medias = await feedRepository.getTrending();
      entries = event.watchList != null
          ? await userListRepository.getContinueList(event.watchList!)
          : const <MediaListEntry>[];

      emit(
        HomeLoaded(
          entries: entries,
          medias: medias,
        ),
      );
    } on AnilistGetListException catch (e) {
      emit(
        HomeError(
          entries: state.entries,
          medias: medias ?? state.medias,
          message: e.error ?? e.cause,
        ),
      );
    } on AnilistGetTrendingException catch (e) {
      emit(
        HomeError(
          entries: entries ?? state.entries,
          medias: state.medias,
          message: e.error ?? e.cause,
        ),
      );
    } catch (e) {
      emit(
        HomeError(
          entries: entries ?? state.entries,
          medias: medias ?? state.medias,
          message: e.toString(),
        ),
      );
    }
  }
}
