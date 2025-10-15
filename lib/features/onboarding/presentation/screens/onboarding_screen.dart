import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Image.asset(AppImages.onboarding),
            SizedBox(height: 70),
            welcomeMessage(),
            SizedBox(height: 60),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Get Strated', style: AppTextStyle.font18WhiteMedium),
              icon: Image.asset(AppICons.foots),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 55),
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(vertical: 12.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column welcomeMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Find Your Best', style: AppTextStyle.font32BlackBold),
        Text('Companion With Us', style: AppTextStyle.font32BlackBold),
        SizedBox(height: 10),
        Text(
          'Join & discover the best suitable pets as',
          style: AppTextStyle.font16DarkGreyRegular,
        ),
        Text(
          'per your preferences in your location',
          style: AppTextStyle.font16DarkGreyRegular,
        ),
      ],
    );
  }
}
