import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouting {
  Route? generateRoute(RouteSettings routesSettings) {
    switch (routesSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }

