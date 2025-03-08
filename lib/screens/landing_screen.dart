import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) context.go('/responsive');
    });
    return Scaffold(
      body: Center(
        child: Expanded(
          child: AnimatedTextKit(
              animatedTexts: [TyperAnimatedText('L O A D I N G . . . .')]),
        ),
      ),
    );
  }
}
