import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Expanded(child: AnimatedTextKit(animatedTexts: [
          TyperAnimatedText('L O A D I N G . . . .')
        ]),),
      ),
    );
  }
}