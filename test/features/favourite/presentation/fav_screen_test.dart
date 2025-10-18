import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/screens/fav_screen.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_empty_view.dart';

void main() {
  setUp(() {
    if (GetIt.I.isRegistered<FavouriteCubit>()) {
      GetIt.I.unregister<FavouriteCubit>();
    }
    getIt.registerLazySingleton<FavouriteCubit>(() => FavouriteCubit());
  });

  group('Favourite Screen Widget Tests', () {
    testWidgets('renders title correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavScreen()));

      expect(find.text('Your Favorite Cats'), findsOneWidget);
    });

    testWidgets('displays empty state when no favourites', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: FavScreen()));

      // Should show empty state since no favourites are added
      expect(find.byType(FavEmptyView), findsOneWidget);
    });
  });

  group('FavEmptyView Widget Tests', () {
    testWidgets('renders empty state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: FavEmptyView())),
      );

      // The FavEmptyView uses SvgPicture.asset, not Icons.favorite_border
      expect(find.byType(SvgPicture), findsOneWidget);

      expect(find.text('Your Favorite list is empty'), findsOneWidget);
      expect(find.text('Add Pets you love to see them here'), findsOneWidget);
    });
  });
}
