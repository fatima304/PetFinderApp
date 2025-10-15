import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/item_listview.dart';

void main() {
  testWidgets('ItemListview renders list of ItemCards', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomScrollView(
          slivers: [
            ItemListview(),
          ],
        ),
      ),
    );

    expect(find.byType(SliverList), findsOneWidget);
  });
}
