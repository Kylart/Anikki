import 'package:anikki/core/core.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeBannerMediaChanged>((event, emit) {
      emit(
        state.copyWith(
          bannerMedia: event.media,
        ),
      );
    });

    on<HomeDrawerMediaChanged>((event, emit) {
      emit(
        HomeState(
          bannerMedia: state.bannerMedia,
          drawerMedia: event.media,
          drawerLibraryEntry: event.libraryEntry,
        ),
      );
    });
  }
}
