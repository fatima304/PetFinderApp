import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/core/routes/routes.dart';

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key, required this.appRouting});

  final AppRouting appRouting;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.generateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
