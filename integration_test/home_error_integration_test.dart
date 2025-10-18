import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/home/data/repository/cat_repository.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';

class _MockCatRepository extends Mock implements CatRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    if (GetIt.I.isRegistered<CatRepository>()) {
      GetIt.I.unregister<CatRepository>();
    }
    if (GetIt.I.isRegistered<CatCubit>()) {
      GetIt.I.unregister<CatCubit>();
    }
    if (GetIt.I.isRegistered<FavouriteCubit>()) {
      GetIt.I.unregister<FavouriteCubit>();
    }
  });

  Widget _buildTestApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting().generateRoute,
      initialRoute: Routes.homeScreen,
    );
  }

  testWidgets('error path shows message and retry', (tester) async {
    final mockRepo = _MockCatRepository();
    getIt.registerLazySingleton<CatRepository>(() => mockRepo);
    getIt.registerFactory<CatCubit>(() => CatCubit(getIt<CatRepository>()));
    getIt.registerLazySingleton<FavouriteCubit>(() => FavouriteCubit());

    when(() => mockRepo.getCatBreeds()).thenThrow(Exception('network'));

    await tester.pumpWidget(_buildTestApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('Error:'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });
}


