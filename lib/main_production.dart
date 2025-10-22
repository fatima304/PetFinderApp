import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/flavors/flavor_config.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  FlavorConfig(
    flavor: Flavor.production,
    appName: "Pet Finder (Prroduction)",
  );

  runApp(PetFinderApp(appRouting: AppRouting()));
}
