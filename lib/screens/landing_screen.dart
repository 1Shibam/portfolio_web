import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:portfolio_web/theme/text_styles.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) context.go('/portfolio');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 29, 29, 29)
        ], tileMode: TileMode.clamp)),
        child: Center(
          child: Expanded(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('L O A D I N G . . . .',
                    textStyle: AppTextStyles.heading(context),
                    speed: const Duration(milliseconds: 80))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
