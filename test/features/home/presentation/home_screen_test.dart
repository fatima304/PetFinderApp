import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/home/presentation/screens/home_screen.dart';

void main() {
  group('HomeScreen UI Tests', () {
    testWidgets('renders HomeHeader and ItemListview', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );

      expect(find.text('Find Your Forever Pet'), findsOneWidget);
      expect(find.byType(ListView), findsWidgets); 
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
