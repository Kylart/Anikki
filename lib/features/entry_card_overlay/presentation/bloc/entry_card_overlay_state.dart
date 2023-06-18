// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    required this.overlay,
    this.isExpanded = false,
  });

  final Media media;
  final GlobalKey key;
  final Offset position;
  final Size size;
  final OverlayEntry overlay;
  final bool isExpanded;

  @override
  List<Object> get props => [
        media,
        key,
        position,
        size,
        overlay,
        isExpanded,
      ];

  EntryCardOverlayActive copyWith({
    Media? media,
    GlobalKey? key,
    Offset? position,
    Size? size,
    OverlayEntry? overlay,
    bool? isExpanded,
  }) {
    return EntryCardOverlayActive(
      media: media ?? this.media,
      key: key ?? this.key,
      position: position ?? this.position,
      size: size ?? this.size,
      overlay: overlay ?? this.overlay,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
