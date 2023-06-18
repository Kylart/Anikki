// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'entry_card_overlay_bloc.dart';

abstract class EntryCardOverlayEvent extends Equatable {
  const EntryCardOverlayEvent();

  @override
  List<Object> get props => [];
}

class EntryCardOverlayExpanded extends EntryCardOverlayEvent {
  const EntryCardOverlayExpanded({
    required this.context,
  });

  final BuildContext context;

  @override
  List<Object> get props => [
        context,
      ];
}

class EntryCardOverlayRequested extends EntryCardOverlayEvent {
  const EntryCardOverlayRequested({
    required this.media,
    required this.key,
    required this.context,
    this.isExpanded = false,
  });

  final Media media;
  final GlobalKey key;
  final BuildContext context;
  final bool isExpanded;

  @override
  List<Object> get props => [
        key,
        context,
        media,
        isExpanded,
      ];
}

class EntryCardOverlayClosed extends EntryCardOverlayEvent {}
