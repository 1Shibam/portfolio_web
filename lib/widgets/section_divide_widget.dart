import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class SectionDividerWidget extends StatelessWidget {
  const SectionDividerWidget(
      {super.key,
      required this.maxHeight,
      required this.title1,
      required this.title2,
      required this.maxWidth});

  final double maxHeight;
  final String title1;
  final String title2;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 0.02 * maxWidth, vertical: maxHeight * 0.03),
      child: Container(
        height: maxHeight * .5,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light, width: 2),
          borderRadius: BorderRadius.circular(0.05 * maxWidth),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    title1,
                    style: AppTextStyles.subheading(context),
                  )
                ],
              ),
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
            Expanded(
              child: Column(
                children: [
                  Text(
                    title2,
                    style: AppTextStyles.subheading(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
