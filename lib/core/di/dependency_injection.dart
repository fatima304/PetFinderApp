import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_factory.dart';
import '../../features/home/data/network/cat_api_service.dart';
import '../../features/home/data/repository/cat_repository.dart';
import '../../features/home/data/repository/cat_repository_impl.dart';
import '../../features/home/presentation/manager/cubit/cat_cubit.dart';
import '../../features/home/presentation/manager/cubit/search_cubit.dart';
import '../../features/favourite/presentation/manager/favourite_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  log('Setting up service locator...');
  
  // Dio
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Cat Api Service
  getIt.registerLazySingleton<CatApiService>(
    () => CatApiService(getIt<Dio>()),
  );

  // Cat Repository
  getIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(getIt<CatApiService>()),
  );
  
  // Cat Cubit
  getIt.registerFactory<CatCubit>(() => CatCubit(getIt<CatRepository>()));

  // Search Cubit
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<CatRepository>()));

  // Favourite Cubit 
  getIt.registerLazySingleton<FavouriteCubit>(
    () => FavouriteCubit(),
  );
  
  log('Service locator setup complete');
}
