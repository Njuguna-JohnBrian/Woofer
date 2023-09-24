import 'package:flutter/material.dart';
import 'package:woofer/screens/welcome.dart';
import 'package:woofer/theme.dart';

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
      home: const WelcomeScreen(),
    );
  }
}
