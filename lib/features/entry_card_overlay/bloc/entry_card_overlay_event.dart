part of 'entry_card_overlay_bloc.dart';

abstract class EntryCardOverlayEvent extends Equatable {
  const EntryCardOverlayEvent();

  @override
  List<Object> get props => [];
}

class EntryCardOverlayRequested extends EntryCardOverlayEvent {
  const EntryCardOverlayRequested({
    required this.key,
    required this.context,
    required this.child,
  });

  final GlobalKey key;
  final BuildContext context;
  final Widget child;

  @override
  List<Object> get props => [key, context, child];
}

class EntryCardOverlayClosed extends EntryCardOverlayEvent {}
