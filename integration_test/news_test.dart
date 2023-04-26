import 'package:anikki/features/news/widgets/news_card.dart';
import 'package:anikki/features/news/widgets/news_layout_toggle.dart';
import 'package:anikki/features/news/widgets/news_tile.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/widgets/loader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:anikki/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration: News', () {
    testWidgets('calendar change triggers a reload of News', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      /// When News has loaded, we should have multiple NewsTiles
      expect(find.byType(NewsTile), findsWidgets);

      /// Checking first entry and keeping it to be compared against later
      final firstEntry = find.byType(NewsTile).first;
      expect(firstEntry, findsOneWidget);

      /// Only on Desktop
      if (isDesktop()) {
        expect(find.text('News'), findsOneWidget);
      }

      /// Checking that calendar is there
      final calendar = find.byIcon(Icons.calendar_month);
      expect(calendar, findsOneWidget);

      /// Tapping Calendar icon button.
      await tester.tap(calendar);
      await tester.pumpAndSettle();

      /// Selecting a date range of 1st to 4th of the month and Saving.
      await tester.tap(find.text(DateTime.now().day == 1 ? '2' : '1').first);
      await tester.tap(find.text('5').first);
      await tester.tap(find.text('Save'));

      await tester.pump(const Duration(milliseconds: 200));

      /// Ensures that we have a loading animation
      final loader = find.byType(Loader);
      expect(loader, findsOneWidget);

      await tester.pumpAndSettle();

      /// Comparing new first entry to stored first entry
      final newFirstEntry = find.byType(NewsTile).first;
      expect(
        newFirstEntry,
        allOf(
          findsOneWidget,
          isNot(firstEntry),
        ),
      );
    });

    testWidgets('Layout toggle changes the layout', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      /// Layout should be list at first
      expect(find.byType(NewsTile), findsWidgets);

      /// Finding the layout toggle button
      final toggle = find.byType(NewsLayoutToggle);
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

      /// Switching to Grid layout
      await tester.tap(gridButton);
      await tester.pumpAndSettle();

      /// NewsLayout should show only NewsCards
      expect(find.byType(NewsCard), findsWidgets);

      /// Switching to List layout
      await tester.tap(listButton);
      await tester.pumpAndSettle();

      /// We should have NewsTiles again
      expect(find.byType(NewsTile), findsWidgets);
    });
  });
}
