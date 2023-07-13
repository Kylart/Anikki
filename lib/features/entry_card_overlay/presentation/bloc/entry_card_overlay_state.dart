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
    this.isExpanded = false,
  });

  final Media media;
  final GlobalKey key;
  final bool isExpanded;

  @override
  List<Object> get props => [
        media,
        key,
        isExpanded,
      ];

  EntryCardOverlayActive copyWith({
    Media? media,
    GlobalKey? key,
    bool? isExpanded,
  }) {
    return EntryCardOverlayActive(
      media: media ?? this.media,
      key: key ?? this.key,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
