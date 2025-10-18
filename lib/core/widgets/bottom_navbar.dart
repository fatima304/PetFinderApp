import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/helper/app_icon.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/features/favourite/presentation/screens/fav_screen.dart';
import 'package:pet_finder_app/features/home/presentation/screens/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [const HomeScreen(), const FavScreen()];

  final List<String> _unselectedIcons = [AppICons.home, AppICons.heart];

  final List<String> _selectedIcons = [AppICons.fillHome, AppICons.fav];

  final List<String> _labels = ['Home', 'Fav'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.darkGrey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(
          _labels.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _unselectedIcons[index],
              color: AppColors.darkGrey,
            ),
            activeIcon: SvgPicture.asset(
              _selectedIcons[index],
              color: AppColors.mainColor,
            ),
            label: _labels[index],
          ),
        ),
      ),
    );
  }
}
