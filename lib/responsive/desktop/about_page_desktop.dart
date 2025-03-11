import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class AboutPageDesktop extends StatelessWidget {
  const AboutPageDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: maxWidth * 0.05, vertical: maxHeight * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: AppTextStyles.heading(context))
              .animate()
              .fade(duration: 200.ms)
              .slideY(),
          SizedBox(height: maxHeight * 0.02),
          Expanded(
            child: Container(
              height: 0.6 * maxHeight,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                border: Border.all(
                  color: AppColors.light.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(0.01 * maxWidth),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child:
                        Center(child: Text('This is about me rells speasking')),
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
          ),
        ],
      ),
    );
  }
}
