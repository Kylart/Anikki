part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.bannerMedia,
  });

  final Media? bannerMedia;

  @override
  List<Object?> get props => [
        bannerMedia,
      ];

  HomeState copyWith({
    Media? bannerMedia,
  }) {
    return HomeState(
      bannerMedia: bannerMedia ?? this.bannerMedia,
    );
  }
}
