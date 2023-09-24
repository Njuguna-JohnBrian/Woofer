import 'package:flutter/material.dart';
import 'package:woofer/theme.dart';

import 'animations/animations_utils/coming_soon.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: const Center(
        child: ComingSoonAnimation(),
      ),
    );
  }
}
