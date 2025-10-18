import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_image_model.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_weight_model.dart';
import 'package:pet_finder_app/features/home/data/repository/cat_repository.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';

class _MockCatRepository extends Mock implements CatRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late _MockCatRepository mockRepo;

  setUp(() async {
    if (GetIt.I.isRegistered<CatRepository>()) {
      GetIt.I.unregister<CatRepository>();
    }
    if (GetIt.I.isRegistered<CatCubit>()) {
      GetIt.I.unregister<CatCubit>();
    }
    if (GetIt.I.isRegistered<FavouriteCubit>()) {
      GetIt.I.unregister<FavouriteCubit>();
    }
    mockRepo = _MockCatRepository();
    getIt.registerLazySingleton<CatRepository>(() => mockRepo);
    getIt.registerFactory<CatCubit>(() => CatCubit(getIt<CatRepository>()));
    getIt.registerLazySingleton<FavouriteCubit>(() => FavouriteCubit());
  });

  Widget _buildTestApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting().generateRoute,
      initialRoute: Routes.homeScreen,
    );
  }

  group('HomeScreen integration', () {
    testWidgets('loads list and navigates to details on tap', (tester) async {
      final sample = [
        CatModelNew(
          id: 'abys',
          name: 'Abyssinian',
          origin: 'Egypt',
          lifeSpan: '14',
          weight: CatWeightModel(imperial: '7 - 10', metric: '3 - 5'),
          image: CatImageModel(
            id: 'abys',
            url: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
            width: 500,
            height: 500,
          ),
        ),
      ];
      when(() => mockRepo.getCatBreeds()).thenAnswer((_) async => sample);

      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

       expect(find.text('Abyssinian'), findsOneWidget);

       await tester.tap(find.text('Abyssinian'));
      await tester.pumpAndSettle();

      expect(find.text('Abyssinian'), findsWidgets);
    });

    testWidgets('shows error and retry when repository fails', (tester) async {
      when(() => mockRepo.getCatBreeds()).thenThrow(Exception('network'));

      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('Error:'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}


