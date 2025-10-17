import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/core/widgets/bottom_navbar.dart';
import 'package:pet_finder_app/features/details/presentation/screens/details_screen.dart';
import 'package:pet_finder_app/features/favourite/presentation/screens/fav_screen.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/presentation/screens/home_screen.dart';
import 'package:pet_finder_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pet_finder_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouting {
  Route? generateRoute(RouteSettings routesSettings) {
    switch (routesSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => CustomBottomNavBar());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.detailsScreen:
        final model = routesSettings.arguments as CatModelNew;

        return MaterialPageRoute(builder: (_) => DetailsScreen(catModelNew: model,));
      case Routes.favScreen:
        return MaterialPageRoute(builder: (_) => FavScreen());
  
    }
    return null;
  }
}
