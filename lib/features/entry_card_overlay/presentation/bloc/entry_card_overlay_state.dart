part of 'entry_card_overlay_bloc.dart';

abstract class EntryCardOverlayState extends Equatable {
  const EntryCardOverlayState();

  @override
  List<Object> get props => [];
}

class EntryCardOverlayEmpty extends EntryCardOverlayState {}

class EntryCardOverlayActive extends EntryCardOverlayState {
  const EntryCardOverlayActive({
    required this.media,
    required this.key,
    required this.position,
    required this.size,
    required this.rootContext,
    this.isExpanded = false,
  });

  final BuildContext rootContext;
  final Media media;
  final GlobalKey key;
  final Offset position;
  final Size size;
  final bool isExpanded;

  @override
  List<Object> get props => [
        rootContext,
        media,
        key,
        position,
        size,
        isExpanded,
      ];

  EntryCardOverlayActive copyWith({
    BuildContext? rootContext,
    Media? media,
    GlobalKey? key,
    Offset? position,
    Size? size,
    bool? isExpanded,
  }) {
    return EntryCardOverlayActive(
      rootContext: rootContext ?? this.rootContext,
      media: media ?? this.media,
      key: key ?? this.key,
      position: position ?? this.position,
      size: size ?? this.size,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
