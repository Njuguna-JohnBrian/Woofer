import 'package:flutter/material.dart';

void main() {
  runApp(const WooferApp());
}

class WooferApp extends StatelessWidget {
  const WooferApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woofer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}

