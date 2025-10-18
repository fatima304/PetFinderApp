import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'dart:async';

import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
      Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); 
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(AppImages.logo)],
        ),
      ),
    );
  }
}
