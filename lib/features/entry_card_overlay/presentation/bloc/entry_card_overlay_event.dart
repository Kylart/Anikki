part of 'entry_card_overlay_bloc.dart';

abstract class EntryCardOverlayEvent extends Equatable {
  const EntryCardOverlayEvent();

  @override
  List<Object> get props => [];
}

class EntryCardOverlayRequested extends EntryCardOverlayEvent {
  const EntryCardOverlayRequested({
    required this.media,
    required this.key,
    required this.context,
  });

  final Media media;
  final GlobalKey key;
  final BuildContext context;

  @override
  List<Object> get props => [
        key,
        context,
      ];
}

class EntryCardOverlayClosed extends EntryCardOverlayEvent {}
