import 'package:flutter/material.dart';
import 'package:portfolio_web/themes/text_styles.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This is mobile screen my nigga',
          style: AppTextStyles.bodyLarge,
        ),
      ),
    );
  }
}
