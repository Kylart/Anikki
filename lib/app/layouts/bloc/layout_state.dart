part of 'layout_bloc.dart';

sealed class LayoutState extends Equatable {
  const LayoutState({
    this.drawerMedia,
    this.drawerLibraryEntry,
  });

  final Media? drawerMedia;
  final LibraryEntry? drawerLibraryEntry;

  @override
  List<Object?> get props => [
        drawerMedia,
        drawerLibraryEntry,
      ];
}

final class LayoutPortrait extends LayoutState {
  const LayoutPortrait({super.drawerMedia, super.drawerLibraryEntry});
}

final class LayoutLandscape extends LayoutState {
  const LayoutLandscape({super.drawerMedia, super.drawerLibraryEntry});
}
