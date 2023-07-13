import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';

import '../../fixtures/anilist.dart';

void main() {
  /// Shuts off logging except for errors
  Logger.level = Level.error;

  final media = anilistMediaMock;
  final key = GlobalKey();

  group('unit test: EntryCardOverlay Bloc', () {
    blocTest(
      'emits [EntryCardOverlayActive] when [EntryCardOverlayRequested] is added',
      build: () => EntryCardOverlayBloc(),
      act: (bloc) => bloc.add(
        EntryCardOverlayRequested(
          media: media,
          key: key,
        ),
      ),
      expect: () => [
        EntryCardOverlayActive(
          media: media,
          key: key,
          isExpanded: false,
        ),
      ],
    );

    blocTest(
      'emits [EntryCardOverlayActive, EntryCardOverlayActive] when [EntryCardOverlayRequested] is added with expanded option',
      build: () => EntryCardOverlayBloc(),
      act: (bloc) => bloc.add(
        EntryCardOverlayRequested(
          media: media,
          key: key,
          isExpanded: true,
        ),
      ),
      expect: () => [
        EntryCardOverlayActive(
          media: media,
          key: key,
          isExpanded: false,
        ),
        EntryCardOverlayActive(
          media: media,
          key: key,
          isExpanded: true,
        ),
      ],
    );

    blocTest<EntryCardOverlayBloc, EntryCardOverlayState>(
      'emits [EntryCardOverlayActive] when [EntryCardOverlayExpanded] is added and is already in [EntryCardOverlayActive] state',
      build: () => EntryCardOverlayBloc(),
      seed: () => EntryCardOverlayActive(
        media: media,
        key: key,
      ),
      act: (bloc) => bloc.add(
        const EntryCardOverlayExpanded(),
      ),
      expect: () => [
        EntryCardOverlayActive(
          media: media,
          key: key,
          isExpanded: true,
        ),
      ],
    );

    blocTest<EntryCardOverlayBloc, EntryCardOverlayState>(
      'emits [] when [EntryCardOverlayExpanded] is added but is not in [EntryCardOverlayActive] state',
      build: () => EntryCardOverlayBloc(),
      seed: () => EntryCardOverlayEmpty(),
      act: (bloc) => bloc.add(
        const EntryCardOverlayExpanded(),
      ),
      expect: () => [],
    );

    blocTest<EntryCardOverlayBloc, EntryCardOverlayState>(
      'emits [EntryCardOverlayEmpty] when [EntryCardOverlayClosed]',
      build: () => EntryCardOverlayBloc(),
      seed: () => EntryCardOverlayActive(
        media: media,
        key: key,
      ),
      act: (bloc) => bloc.add(
        EntryCardOverlayClosed(),
      ),
      expect: () => [
        EntryCardOverlayEmpty(),
      ],
    );

    blocTest<EntryCardOverlayBloc, EntryCardOverlayState>(
      'emits [] when [EntryCardOverlayClosed] but not in [EntryCardOverlayActive] state',
      build: () => EntryCardOverlayBloc(),
      act: (bloc) => bloc.add(
        EntryCardOverlayClosed(),
      ),
      expect: () => [],
    );
  });
}
