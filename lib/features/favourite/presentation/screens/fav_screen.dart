import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/features/favourite/presentation/widgets/fav_card.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/tabbar_widget.dart';

// ignore: must_be_immutable
class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(
                'Your Favorite Pets',
                style: AppTextStyle.font24BlackBold,
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: CustomTabBar(
                tabs: tabs,
                selectedIndex: selectedTabIndex,
                onTabSelected: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return FavCard();
              }, childCount: 10),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
