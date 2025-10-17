import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/details/presentation/widgets/pet_details.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
    DetailsScreen({super.key,this.catModelNew});
  CatModelNew? catModelNew;

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<FavouriteCubit>(
      create: (context) => getIt<FavouriteCubit>()..loadFavourites(),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: PetDetailsSection(cat: catModelNew!)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

