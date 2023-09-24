import 'package:flutter/material.dart';

import '../animations/animations_utils/woofer_animation.dart';
import '../theme.dart';
import 'onboarding/onboarding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
          (route) => false);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WooferAnimation(),
          Text(
            "Woofer 🐾🐾",
            style: WFTheme.lightTextTheme.headline1?.copyWith(
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                letterSpacing: 3),
          )
        ],
      ),
    );
  }
}
