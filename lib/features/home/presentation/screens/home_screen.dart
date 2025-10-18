import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home_header.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/item_listview.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CatCubit _catCubit;

  @override
  void initState() {
    super.initState();
    _catCubit = getIt<CatCubit>()..getCatBreeds();
  }

  @override
  void dispose() {
    _catCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatCubit>(create: (context) => _catCubit),
        BlocProvider<FavouriteCubit>(
          create: (context) => getIt<FavouriteCubit>()..loadFavourites(),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: HomeHeader()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const ItemListview(),
            ],
          ),
        ),
      ),
    );
  }
}
