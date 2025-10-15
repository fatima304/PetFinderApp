import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            Image.asset(AppImages.logo, width: 100, height: 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  spacing: 5,
                  children: [
                    Text('Name', style: AppTextStyle.font18BlackBold),
                    Text(
                      'Orign',
                      style: AppTextStyle.font16DarkGreyRegular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Life Span',
                      style: AppTextStyle.font16DarkGreyRegular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AppICons.fav, color: AppColors.mainColor),
            ),
          ],
        ),
      ),
    );
  }
}
