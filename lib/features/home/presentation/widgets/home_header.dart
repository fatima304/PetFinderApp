import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/search_field.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/tabbar_widget.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int selectedTabIndex = 0;

  final List<String> tabs = [
    'All',
    'Cats',
    'Dogs',
    'Birds',
    'Fishs',
    'Reptiles',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Text('Find Your Forever Pet', style: AppTextStyle.font24BlackBold),
        const SizedBox(height: 20),
        const SearchTextField(),
        const SizedBox(height: 12),
        CustomTabBar(
          tabs: tabs,
          selectedIndex: selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
        ),
      ],
    );
  }
}
