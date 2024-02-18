part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();

  @override
  List<Object?> get props => [];
}

class LayoutSizeChanged extends LayoutEvent {
  const LayoutSizeChanged(this.constraints);

  final BoxConstraints constraints;

  @override
  List<Object?> get props => [
        constraints,
      ];
}

final class LayoutDrawerMediaChanged extends LayoutEvent {
  const LayoutDrawerMediaChanged([
    this.media,
    this.libraryEntry,
  ]);

  final Media? media;
  final LibraryEntry? libraryEntry;

  @override
  List<Object?> get props => [
        media,
        libraryEntry,
      ];
}
