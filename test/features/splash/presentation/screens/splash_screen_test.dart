import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/splash/presentation/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen shows the logo image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final Image imageWidget = tester.widget(imageFinder);
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, AppImages.logo);

    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('SplashScreen navigates to OnboardingScreen after 5 seconds', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SplashScreen(),
        routes: {
          Routes.onboardingScreen: (context) => const Scaffold(
            body: Text('Onboarding Screen'),
          ),
        },
      ),
    );

    await tester.pump(const Duration(seconds: 5));

    await tester.pumpAndSettle();

    expect(find.text('Onboarding Screen'), findsOneWidget);
  });
}
