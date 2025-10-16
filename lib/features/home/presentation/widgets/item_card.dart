import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_state.dart';
import '../../data/models/cat/cat_model_new.dart';

class ItemCard extends StatelessWidget {
  final CatModelNew cat;

  const ItemCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      bloc: getIt<FavouriteCubit>(),
      builder: (context, state) {
        final isFavourite = getIt<FavouriteCubit>().isFavourite(cat.id);

        return Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.darkGrey, width: 0.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: cat.image?.url != null
                      ? Image.network(
                          cat.image!.url,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: AppColors.lightGrey,
                              child: const Icon(Icons.pets, size: 50),
                            );
                          },
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          color: AppColors.lightGrey,
                          child: const Icon(Icons.pets, size: 50),
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cat.name!, style: AppTextStyle.font18BlackBold),
                      const SizedBox(height: 5),
                      Text(
                        'Origin: ${cat.origin ?? 'Unknown'}',
                        style: AppTextStyle.font16DarkGreyRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Life Span: ${cat.lifeSpan ?? 'Unknown'} years',
                        style: AppTextStyle.font16DarkGreyRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getIt<FavouriteCubit>().toggleFavourite(cat);
                  },
                  child: SvgPicture.asset(
                    isFavourite ? AppICons.fav : AppICons.heart,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
