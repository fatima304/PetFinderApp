import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/features/details/presentation/widgets/card_details.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_state.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';

class PetDetailsSection extends StatelessWidget {
  final CatModelNew cat;

  const PetDetailsSection({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      bloc: getIt<FavouriteCubit>(),
      builder: (context, state) {
        final isFavourite = getIt<FavouriteCubit>().isFavourite(cat.id);

        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.teal,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: cat.image?.url != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            child: Image.network(
                              cat.image!.url,
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  height: 300,
                                  color: AppColors.lightGrey,
                                  child: const Icon(Icons.pets, size: 100),
                                );
                              },
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            height: 300,
                            color: AppColors.lightGrey,
                            child: const Icon(Icons.pets, size: 100),
                          ),
                  ),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        getIt<FavouriteCubit>().toggleFavourite(cat);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          isFavourite ? AppICons.fav : AppICons.heart,
                          color: AppColors.mainColor,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.5),
              child: PetDetailsWidget(cat: cat),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Adoption feature coming soon!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 55),
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(vertical: 12.5),
              ),
              child: Text('Adopt me', style: AppTextStyle.font18WhiteMedium),
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class PetDetailsWidget extends StatelessWidget {
  final CatModelNew cat;

  const PetDetailsWidget({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cat.name ?? 'Unknown', style: AppTextStyle.font24BlackBold),
        const SizedBox(height: 15),
        Row(
          children: [
            Image.asset(AppICons.location),
            const SizedBox(width: 5),
            Text(
              cat.origin ?? 'Unknown',
              style: AppTextStyle.font16DarkGreyRegular.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardDetails(
              desc: cat.weight?.metric ?? 'Unknown',
              title: 'Weight (kg)',
            ),
            CardDetails(
              desc: '${cat.lifeSpan ?? 'Unknown'} years',
              title: 'Life Span',
            ),
          ],
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildCharacteristicChip('Adaptability', cat.adaptability ?? 0),
            _buildCharacteristicChip('Child Friendly', cat.childFriendly ?? 0),
            _buildCharacteristicChip('Energy Level', cat.energyLevel ?? 0),
            _buildCharacteristicChip('Intelligence', cat.intelligence ?? 0),
          ],
        ),
        const SizedBox(height: 15),

        Text(
          'About',
          style: AppTextStyle.font14SemiBold.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 15),
        Text(
          cat.description ?? 'No description available',
          style: AppTextStyle.font16DarkGreyRegular,
        ),
      ],
    );
  }

  Widget _buildCharacteristicChip(String label, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        '$label: $value/5',
        style: AppTextStyle.font14SemiBold.copyWith(
          fontSize: 15,
          color: AppColors.white,
        ),
      ),
    );
  }
}
