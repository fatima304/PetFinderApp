import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';

class FavEmptyView extends StatelessWidget {
  const FavEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        SvgPicture.asset(AppICons.heart, width: 50, height: 50),
        const SizedBox(height: 16),
        Text(
          'Your Favorite list is empty',
          style: AppTextStyle.font24BlackBold,
        ),
        const SizedBox(height: 8),
        Text(
          'Add Pets you love to see them here',
          style: AppTextStyle.font16DarkGreyRegular.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
