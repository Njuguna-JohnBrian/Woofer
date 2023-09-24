import 'package:flutter/material.dart';
import 'package:woofer/theme.dart';

import 'animations/animations_utils/woofer_animation.dart';

void main() {
  runApp(const WooferApp());
}

class WooferApp extends StatelessWidget {
  const WooferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woofer',
      debugShowCheckedModeBanner: false,
      theme: WFTheme.light(),
      home: Scaffold(
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
      ),
    );
  }
}
