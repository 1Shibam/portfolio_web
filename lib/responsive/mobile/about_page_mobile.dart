import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

class AboutPageMobile extends StatelessWidget {
  const AboutPageMobile({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(child: Text('This is about me rells speasking')),
            ),
            SizedBox(
              height: maxHeight * 0.6,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
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
