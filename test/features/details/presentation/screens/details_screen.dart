import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/details/presentation/screens/details_screen.dart';

void main() {
  group('DetailsScreen Widget Tests', () {
    testWidgets('renders DetailsScreen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DetailsScreen()));

      expect(find.byType(Image), findsWidgets);
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Origin'), findsOneWidget);
      expect(find.text('Weight'), findsOneWidget);
      expect(find.text('Life Span'), findsOneWidget);
      expect(find.text('Metric'), findsOneWidget);
      expect(find.text('Life Span'), findsNWidgets(2));
      expect(find.text('About'), findsNWidgets(2));
      expect(find.text('Adopt me'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('tapping Adopt me button does not crash', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: DetailsScreen()));

      final buttonFinder = find.text('Adopt me');
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
      await tester.pump();
    });
  });
}
