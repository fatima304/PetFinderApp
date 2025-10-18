import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routes/app_routing.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(PetFinderApp(appRouting: AppRouting()));
}
