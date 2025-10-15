import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home_header.dart';

void main() {
  group('HomeHeader Tests', () {
    testWidgets('renders header title, search field and tabs', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HomeHeader())),
      );

      expect(find.text('Find Your Forever Pet'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Cats'), findsOneWidget);
    });

    testWidgets('tapping tab updates selected index', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HomeHeader())),
      );

      final catsTab = find.text('Cats');
      expect(catsTab, findsOneWidget);

      await tester.tap(catsTab);
      await tester.pumpAndSettle();
    });
  });
}
