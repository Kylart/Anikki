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
    required this.rootContext,
    this.isExpanded = false,
  });

  final BuildContext rootContext;
  final Media media;
  final GlobalKey key;
  final bool isExpanded;

  @override
  List<Object> get props => [
        rootContext,
        media,
        key,
        isExpanded,
      ];

  EntryCardOverlayActive copyWith({
    BuildContext? rootContext,
    Media? media,
    GlobalKey? key,
    bool? isExpanded,
  }) {
    return EntryCardOverlayActive(
      rootContext: rootContext ?? this.rootContext,
      media: media ?? this.media,
      key: key ?? this.key,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
