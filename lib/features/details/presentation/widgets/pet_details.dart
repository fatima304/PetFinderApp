import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/features/details/presentation/widgets/card_details.dart';

class PetDetailsSection extends StatelessWidget {
  const PetDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Image.asset(AppImages.onboarding),
        ),
        Padding(padding: const EdgeInsets.all(16.5), child: PetDetailsWidget()),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(300, 55),
            backgroundColor: AppColors.mainColor,
            padding: const EdgeInsets.symmetric(vertical: 12.5),
          ),
          child: Text('Adopt me', style: AppTextStyle.font18WhiteMedium),
        ),
      ],
    );
  }
}

class PetDetailsWidget extends StatelessWidget {
  const PetDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text('Name', style: AppTextStyle.font24BlackBold),
        Row(
          spacing: 5,
          children: [
            Image.asset(AppICons.location),
            Text(
              'Origin',
              style: AppTextStyle.font16DarkGreyRegular.copyWith(fontSize: 18),
            ),
          ],
        ),
        Row(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardDetails(desc: 'Metric', title: 'Weight'),
            CardDetails(desc: 'Life Span', title: 'Life Span'),
          ],
        ),
        Text(
          'About',
          style: AppTextStyle.font14SemiBold.copyWith(fontSize: 22),
        ),
        Text('About', style: AppTextStyle.font16DarkGreyRegular),
      ],
    );
  }
}
