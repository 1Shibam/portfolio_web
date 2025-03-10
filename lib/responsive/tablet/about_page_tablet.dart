import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

class AboutPageTab extends StatelessWidget {
  const AboutPageTab({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.02 * maxWidth,
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light, width: 2),
          borderRadius: BorderRadius.circular(0.05 * maxWidth),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Center(child: Text('This is about me rells speasking')),
            ),
            SizedBox(
              height: maxHeight * 0.6,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: VerticalDivider(
                  thickness: 2,
                  color: AppColors.light,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text('This is where I put my skills I don’t have'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}