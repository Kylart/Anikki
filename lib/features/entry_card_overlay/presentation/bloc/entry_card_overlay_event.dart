// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'entry_card_overlay_bloc.dart';

abstract class EntryCardOverlayEvent extends Equatable {
  const EntryCardOverlayEvent();

  @override
  List<Object> get props => [];
}

class EntryCardOverlayExpanded extends EntryCardOverlayEvent {
  const EntryCardOverlayExpanded();
}

class EntryCardOverlayRequested extends EntryCardOverlayEvent {
  const EntryCardOverlayRequested({
    required this.media,
    required this.key,
    this.isExpanded = false,
  });

  final Media media;
  final GlobalKey key;
  final bool isExpanded;

  @override
  List<Object> get props => [
        key,
        media,
        isExpanded,
      ];
}

class EntryCardOverlayClosed extends EntryCardOverlayEvent {}
