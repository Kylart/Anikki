part of 'layout_bloc.dart';

sealed class LayoutState extends Equatable {
  const LayoutState({
    this.drawerMedia,
    this.drawerLibraryEntry,
  });

  final Media? drawerMedia;
  final LibraryEntry? drawerLibraryEntry;

  bool get drawerOpen => drawerMedia != null;

  @override
  List<Object?> get props => [
        drawerMedia,
        drawerLibraryEntry,
      ];
}

final class LayoutPortrait extends LayoutState {
  const LayoutPortrait({super.drawerMedia, super.drawerLibraryEntry});

  LayoutPortrait copyWith(
      Media? drawerMedia, LibraryEntry? drawerLibraryEntry) {
    return LayoutPortrait(
      drawerMedia: drawerMedia ?? this.drawerMedia,
      drawerLibraryEntry: drawerLibraryEntry ?? this.drawerLibraryEntry,
    );
  }
}

final class LayoutLandscape extends LayoutState {
  const LayoutLandscape({super.drawerMedia, super.drawerLibraryEntry});

  LayoutLandscape copyWith(
      Media? drawerMedia, LibraryEntry? drawerLibraryEntry) {
    return LayoutLandscape(
      drawerMedia: drawerMedia ?? this.drawerMedia,
      drawerLibraryEntry: drawerLibraryEntry ?? this.drawerLibraryEntry,
    );
  }
}
