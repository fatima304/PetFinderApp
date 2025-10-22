import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';
import 'package:pet_finder_app/flavors/flavor_config.dart';

class PetFinderApp extends StatelessWidget {
  final AppRouting appRouting;

  const PetFinderApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    final flavor = FlavorConfig.instance.flavor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.generateRoute,
      initialRoute: Routes.splashScreen,
      builder: (context, child) {
        return Banner(
          message: flavor == Flavor.development ? "DEV" : "PROD",
          location: BannerLocation.topStart,
          color: flavor == Flavor.development
              ? AppColors.black
              : AppColors.mainColor,
          child: child!,
        );
      },
    );
  }
}
