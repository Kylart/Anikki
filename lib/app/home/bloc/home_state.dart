part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.currentMedia,
    this.entries = const [],
  });

  final Media? currentMedia;
  final List<MediaListEntry> entries;

  @override
  List<Object?> get props => [
        currentMedia,
        entries,
      ];

  @override
  String toString() => [
        'HomeState(',
        'currentMedia: ${currentMedia?.title}, ',
        '${entries.length} entries, ',
        ')'
      ].join('');

  HomeState copyWith({
    Media? currentMedia,
    List<MediaListEntry>? entries,
  }) {
    return HomeState(
      currentMedia: currentMedia ?? this.currentMedia,
      entries: entries ?? this.entries,
    );
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  const HomeLoading({
    super.entries,
  });
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    super.entries,
  });
}

final class HomeError extends HomeState {
  const HomeError({
    super.entries,
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [
        entries,
        message,
      ];
}
