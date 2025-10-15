import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/tabbar_widget.dart';

void main() {
  testWidgets('CustomTabBar shows all tabs and reacts to taps', (tester) async {
    int selected = 0;
    final tabs = ['All', 'Cats', 'Dogs'];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTabBar(
            tabs: tabs,
            selectedIndex: selected,
            onTabSelected: (index) {
              selected = index;
            },
          ),
        ),
      ),
    );

    expect(find.text('All'), findsOneWidget);
    expect(find.text('Cats'), findsOneWidget);
    expect(find.text('Dogs'), findsOneWidget);

    await tester.tap(find.text('Cats'));
    await tester.pump();

    expect(selected, 1);
  });
}
