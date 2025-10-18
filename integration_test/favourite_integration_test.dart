import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_image_model.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_weight_model.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    if (GetIt.I.isRegistered<FavouriteCubit>()) {
      GetIt.I.unregister<FavouriteCubit>();
    }
    getIt.registerLazySingleton<FavouriteCubit>(() => FavouriteCubit());
  });

  Widget buildTestApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting().generateRoute,
      initialRoute: Routes.favScreen,
    );
  }

  testWidgets('Favourite screen shows empty state initially', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    expect(find.text('Your Favorite Cats'), findsOneWidget);
    expect(find.text('Your Favorite list is empty'), findsOneWidget);
  });

  testWidgets('Favourite screen can add and remove cats', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

     final cat = CatModelNew(
      id: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      lifeSpan: '14',
      weight: CatWeightModel(imperial: '7 - 10', metric: '3 - 5'),
      image: CatImageModel(
        id: 'abys',
        width: 500,
        height: 500,
        url: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
      ),
    );

    getIt<FavouriteCubit>().toggleFavourite(cat);
    await tester.pumpAndSettle();

     expect(find.text('Abyssinian'), findsOneWidget);

     getIt<FavouriteCubit>().toggleFavourite(cat);
    await tester.pumpAndSettle();

     expect(find.text('Your Favorite list is empty'), findsOneWidget);
  });
}
