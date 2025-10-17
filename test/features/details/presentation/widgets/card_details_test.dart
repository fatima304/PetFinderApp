import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/details/presentation/widgets/card_details.dart';

void main() {
  group('CardDetails Widget Tests', () {
    testWidgets('renders title and description correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardDetails(
              title: 'Weight (kg)',
              desc: '4 - 7',
            ),
          ),
        ),
      );

      expect(find.text('Weight (kg)'), findsOneWidget);
      expect(find.text('4 - 7'), findsOneWidget);
    });

    testWidgets('renders with different title and description', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardDetails(
              title: 'Life Span',
              desc: '12 - 15 years',
            ),
          ),
        ),
      );

      expect(find.text('Life Span'), findsOneWidget);
      expect(find.text('12 - 15 years'), findsOneWidget);
    });

    testWidgets('has correct styling and structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardDetails(
              title: 'Test Title',
              desc: 'Test Description',
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      
      expect(find.byType(Column), findsOneWidget);
      
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });
}
