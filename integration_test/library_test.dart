import 'package:anikki/features/library/library.dart';
import 'package:anikki/features/library/view/library_layout.dart';
import 'package:anikki/features/library/widgets/library_card.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/layouts/portrait/anikki_navigation_bar.dart';
import 'package:anikki/user_list/user_list_app_bar.dart';
import 'package:anikki/user_list/user_list_layout_toggle.dart';
import 'package:anikki/widgets/anikki_action_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:anikki/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration: Library', () {
    testWidgets('can select a folder', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      if (isDesktop()) {
        /// Checking for existence of [LibraryView].
        final library = find.byType(LibraryView);
        expect(library, findsOneWidget);

        /// Checking [UserListAppBar]
        final userListAppBar = find.byType(UserListAppBar);
        expect(userListAppBar, findsOneWidget);

        /// Finding the Settings button and clicking on it
        final settingsButton = find.descendant(
            of: userListAppBar, matching: find.byType(AnikkiActionButton));
        expect(settingsButton, findsOneWidget);

        await tester.tap(settingsButton);
        await tester.pumpAndSettle();

        /// Finds the `Change Folder` button
        final changeFolderButton = find.text('Change folder');
        expect(changeFolderButton, findsOneWidget);
      } else {
        /// Finds main navigation bar
        final navBar = find.byType(AnikkiNavigationBar);
        expect(navBar, findsOneWidget);

        /// Finds library view button
        final libraryButton = find.byIcon(Icons.library_books_outlined);
        expect(libraryButton, findsOneWidget);

        await tester.tap(libraryButton);
        await tester.pumpAndSettle();

        /// Checking for existence of [LibraryView].
        final library = find.byType(LibraryView);
        expect(library, findsOneWidget);

        /// Finds Change folder button
        final folderButton = find.byIcon(Icons.folder_open_outlined);
        expect(folderButton, findsOneWidget);
      }
    });

    testWidgets('layout toggle changes the layout', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      final layout = find.byType(LibraryLayout);
      expect(layout, findsOneWidget);

      /// Layout should be grid at first
      expect(
        find.descendant(
          of: layout,
          matching: find.byType(LibraryCard),
        ),
        findsWidgets,
      );

      /// Finding the layout toggle button
      final toggle = find.byType(UserListLayoutToggle);
      expect(toggle, findsOneWidget);

      /// Finding the list toggle button
      final listButton =
          find.descendant(of: toggle, matching: find.byIcon(Icons.list));
      expect(listButton, findsOneWidget);

      /// Finding the grid toggle button
      final gridButton = find.descendant(
        of: toggle,
        matching: find.byIcon(Icons.grid_view),
      );
      expect(gridButton, findsOneWidget);

      /// Switching to List layout
      await tester.tap(listButton);
      await tester.pumpAndSettle();

      /// LibraryLayout should show only EntryTiles
      expect(
        find.descendant(
          of: layout,
          matching: find.byType(ListTile),
        ),
        findsWidgets,
      );

      /// Switching to Grid layout
      await tester.tap(gridButton);
      await tester.pumpAndSettle();

      /// We should have LibraryCards again
      expect(
        find.descendant(
          of: layout,
          matching: find.byType(LibraryCard),
        ),
        findsWidgets,
      );
    });
  });
}
