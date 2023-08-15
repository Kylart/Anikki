part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.media,
  });

  final Media? media;

  @override
  List<Object?> get props => [
        media,
      ];

  HomeState copyWith({
    Media? media,
  }) {
    return HomeState(
      media: media ?? this.media,
    );
  }
}
