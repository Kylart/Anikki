part of 'entry_card_overlay_bloc.dart';

abstract class EntryCardOverlayState extends Equatable {
  const EntryCardOverlayState();

  @override
  List<Object> get props => [];
}

class EntryCardOverlayEmpty extends EntryCardOverlayState {}

class EntryCardOverlayActive extends EntryCardOverlayState {
  const EntryCardOverlayActive({
    required this.key,
    required this.position,
    required this.size,
    required this.overlay,
  });

  final GlobalKey key;
  final Offset position;
  final Size size;
  final OverlayEntry overlay;

  @override
  List<Object> get props => [key, position, size, overlay];
}
