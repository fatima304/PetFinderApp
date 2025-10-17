import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_state.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_card.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_empty_view.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    getIt<FavouriteCubit>().loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      bloc: getIt<FavouriteCubit>(),
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: Text(
                    'Your Favorite Cats',
                    style: AppTextStyle.font24BlackBold,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                if (state is FavouriteSuccess && state.favouriteCats.isEmpty)
                  const SliverToBoxAdapter(child: Center(child: FavEmptyView()))
                else if (state is FavouriteSuccess &&
                    state.favouriteCats.isNotEmpty)
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final cat = state.favouriteCats[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.detailsScreen,
                            arguments: cat,
                          );
                        },
                        child: FavCard(cat: cat),
                      );
                    }, childCount: state.favouriteCats.length),
                  )
                else
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          ),
        );
      },
    );
  }
}
