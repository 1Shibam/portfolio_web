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
      padding: EdgeInsets.only(bottom: maxHeight * 0.02),
      child: Container(
        padding: EdgeInsets.all(maxWidth * 0.03),
        height: maxHeight * .7,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(0.01 * maxWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Text(
                    'Project Name',
                    style: AppTextStyles.bold(context),
                  )),
                  Flexible(
                    child: Text(
                      'This is the project where i do this and that and achieved nothing really i am delusional to be really hones :D',
                      style: AppTextStyles.medium(context),
                    ),
                  ),
                  Flexible(
                      child: Divider(
                    color: AppColors.light.withOpacity(0.3),
                  )),
                ],
              ),
            )),
            SizedBox(
              height: maxHeight * 0.001,
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                // Ensures the row takes full height
                height: double.maxFinite,
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, // Makes children match height
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title1,
                            style: AppTextStyles.normal(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
                      child: VerticalDivider(
                        color: AppColors.light.withOpacity(0.3),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title2,
                            style: AppTextStyles.normal(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
