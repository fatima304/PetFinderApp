
import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/core/theme/font_weight_helper.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key, required this.desc, required this.title,
  });

final String desc;
final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 5,
        children: [
          Text(
           title,
            style: AppTextStyle.font18WhiteMedium.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
           desc,
            style: AppTextStyle.font16DarkGreyRegular.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ],
      ),
    );
  }
}
