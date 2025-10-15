import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/font_family_helper.dart';
import 'package:pet_finder_app/core/theme/font_weight_helper.dart';

class AppTextStyle {
  static TextStyle font32BlackBold = TextStyle(
    fontSize: 32,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
    fontFamily: FontFamilyHelper.poppinsFont,
  );
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
    fontFamily: FontFamilyHelper.poppinsFont,
  );
  static TextStyle font16DarkGreyRegular = TextStyle(
    fontSize: 16,
    color: AppColors.darkGrey,
    fontWeight: FontWeightHelper.regular,
    fontFamily: FontFamilyHelper.poppinsFont,
  );
  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
    fontFamily: FontFamilyHelper.poppinsFont,
  );

  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
    fontFamily: FontFamilyHelper.poppinsFont,
  );
}
