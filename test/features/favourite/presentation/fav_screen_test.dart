import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/favourite/presentation/screens/fav_screen.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_card.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_empty_view.dart';

void main() {
  group('Favourite Screen Widget Tests', () {
    testWidgets('renders title and tabs correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavScreen()));

      expect(find.text('Your Favorite Pets'), findsOneWidget);

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Cats'), findsOneWidget);
      expect(find.text('Dogs'), findsOneWidget);
    });

    testWidgets('displays list of FavCard items in grid', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavScreen()));

      expect(find.byType(FavCard), findsWidgets);
    });

    testWidgets('tab selection changes state', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: FavScreen()));

      await tester.tap(find.text('Dogs'));
      await tester.pump();

      expect(find.text('Dogs'), findsOneWidget);
    });
  });

  group('FavEmptyView Widget Tests', () {
    testWidgets('renders empty state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: FavEmptyView())),
      );

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      expect(find.text('Your Favorite list is empty'), findsOneWidget);
      expect(find.text('Add Pets you love to see them here'), findsOneWidget);
    });
  });
}
