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

  Widget _buildTestApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting().generateRoute,
      initialRoute: Routes.detailsScreen,
      onGenerateInitialRoutes: (name) {
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
        return [
          AppRouting().generateRoute(
             RouteSettings(name: Routes.detailsScreen, arguments: cat),
          )!,
        ];
      },
    );
  }

  testWidgets('Details renders and toggles favourite, shows snackbar', (tester) async {
    await tester.pumpWidget(_buildTestApp());
    await tester.pumpAndSettle();

    expect(find.text('Abyssinian'), findsWidgets);

    
    getIt<FavouriteCubit>().toggleFavourite(
      CatModelNew(id: 'abys', name: 'Abyssinian'),
    );
    await tester.pumpAndSettle();

     await tester.tap(find.text('Adopt me'));
    await tester.pump();
    expect(find.text('Adoption feature coming soon!'), findsOneWidget);
  });
}


