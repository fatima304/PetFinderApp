import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';

class FavEmptyView extends StatelessWidget {
  const FavEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Your Favorite list is empty',
            style: AppTextStyle.font24BlackBold
          ),
          const SizedBox(height: 8),
          Text(
            'Add Pets you love to see them here',
            style: AppTextStyle.font16DarkGreyRegular.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
