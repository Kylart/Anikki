part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeBannerMediaChanged extends HomeEvent {
  const HomeBannerMediaChanged(this.media);

  final Media? media;

  @override
  List<Object?> get props => [
        media,
      ];
}
