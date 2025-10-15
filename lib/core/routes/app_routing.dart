import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/details/presentation/screens/details_screen.dart';
import 'package:pet_finder_app/features/favourite/presentation/screens/fav_screen.dart';
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
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
      case Routes.favScreen:
        return MaterialPageRoute(builder: (_) => FavScreen());
    }
    return null;
  }
}
