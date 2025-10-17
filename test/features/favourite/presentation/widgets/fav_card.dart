import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_card.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_image_model.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_weight_model.dart';

void main() {
  setUp(() {
    if (GetIt.I.isRegistered<FavouriteCubit>()) {
      GetIt.I.unregister<FavouriteCubit>();
    }
    getIt.registerLazySingleton<FavouriteCubit>(() => FavouriteCubit());
  });

  group('FavCard Widget Tests', () {
    testWidgets('renders cat information correctly', (WidgetTester tester) async {
      final cat = CatModelNew(
        id: 'beng',
        name: 'Bengal',
        origin: 'United States',
        lifeSpan: '12 - 15',
        weight: CatWeightModel(imperial: '10 - 15', metric: '4 - 7'),
        image: CatImageModel(
          id: 'beng',
          url: 'https://cdn2.thecatapi.com/images/JF_y8_o-z.jpg',
          width: 1200,
          height: 800,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavCard(cat: cat),
          ),
        ),
      );

      expect(find.text('Bengal'), findsOneWidget);
      expect(find.text('United States'), findsOneWidget);
    });

    testWidgets('renders with unknown data when fields are null', (WidgetTester tester) async {
      final cat = CatModelNew(
        id: 'unknown',
        name: null,
        origin: null,
        lifeSpan: null,
        weight: null,
        image: null,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavCard(cat: cat),
          ),
        ),
      );

      expect(find.text('Unknown'), findsNWidgets(2)); // name and origin
    });

    testWidgets('has correct structure and styling', (WidgetTester tester) async {
      final cat = CatModelNew(
        id: 'test',
        name: 'Test Cat',
        weight: CatWeightModel(imperial: '10', metric: '5'),
        image: CatImageModel(id: 'test', url: 'test.jpg', width: 100, height: 100),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavCard(cat: cat),
          ),
        ),
      );

      // Check that it has a Container
      expect(find.byType(Container), findsWidgets);
      
      // Check that it has a Column
      expect(find.byType(Column), findsWidgets);
      
      // Check that it has a Row
      expect(find.byType(Row), findsOneWidget);
      
      // Check that it has a GestureDetector for the heart icon
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('shows placeholder when image URL is null', (WidgetTester tester) async {
      final cat = CatModelNew(
        id: 'no-image',
        name: 'No Image Cat',
        weight: CatWeightModel(imperial: '10', metric: '5'),
        image: null,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavCard(cat: cat),
          ),
        ),
      );

      // Should show the placeholder icon
      expect(find.byIcon(Icons.pets), findsOneWidget);
    });
  });
}
