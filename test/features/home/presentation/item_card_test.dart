import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/item_card.dart';

void main() {
  testWidgets('ItemCard displays name, origin, lifespan and fav icon', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ItemCard(),
        ),
      ),
    );

    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Orign'), findsOneWidget);
    expect(find.text('Life Span'), findsOneWidget);
    expect(find.byType(GestureDetector), findsWidgets);
  });
}
