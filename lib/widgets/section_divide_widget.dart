import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class SectionDividerWidget extends StatelessWidget {
  const SectionDividerWidget(
      {super.key,
      required this.maxHeight,
      required this.projectName,
      required this.projectDesc,
      required this.techStacks,
      required this.section1,
      required this.section2,
      required this.maxWidth});

  final double maxHeight;
  final String projectName;
  final String projectDesc;
  final String section1;
  final String section2;
  final double maxWidth;
  final List<String> techStacks;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                      projectName,
                      style: AppTextStyles.bold(context),
                    )),
                    Flexible(
                      child: Text(
                        projectDesc,
                        style: AppTextStyles.medium(context),
                      ),
                    ),
                    Flexible(
                        child: Divider(
                      color: AppColors.light.withOpacity(0.3),
                    )),
                  ],
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
                            section1,
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
                            section2,
                            style: AppTextStyles.normal(context),
                          ),
                          SizedBox(
                            height: maxHeight * 0.01,
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: techStacks.length,
                            itemBuilder: (context, index) {
                              return IntroductionTile(
                                      key: ValueKey(techStacks[index]),
                                      isSkillSection: true,
                                      text: techStacks[index])
                                  .animate()
                                  .fade(
                                      duration: 600.ms,
                                      delay:
                                          (index * 100).ms) // Staggered delay
                                  .slideX(
                                      begin: 1,
                                      curve: Curves.easeInOut,
                                      duration: 500.ms,
                                      delay: (index * 100).ms);
                            },
                          ))
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
