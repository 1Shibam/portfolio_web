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
              .fade(duration: 1000.ms)
              .slideX(curve: Curves.easeIn, duration: 400.ms),
          SizedBox(height: maxHeight * 0.02),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: maxWidth * 0.01, vertical: maxHeight * 0.05),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                border: Border.all(
                  color: AppColors.light.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(0.01 * maxWidth),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Introduction',
                        style: AppTextStyles.bold(context),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const IntroductionTile(
                            isSkillSection: false,
                          )
                              .animate()
                              .fade(
                                  duration: 600.ms,
                                  delay: (index * 200).ms) // Staggered delay
                              .slideX(
                                  curve: Curves.easeInOut,
                                  duration: 500.ms,
                                  delay: (index * 200).ms);
                        },
                      ))
                    ],
                  )),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Skills',
                          style: AppTextStyles.bold(context),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const IntroductionTile(
                              isSkillSection: true,
                            )
                                .animate()
                                .fade(
                                    duration: 600.ms,
                                    delay: (index * 200).ms) // Staggered delay
                                .slideX(
                                    begin: 1,
                                    curve: Curves.easeInOut,
                                    duration: 500.ms,
                                    delay: (index * 200).ms);
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fade(duration: 1000.ms)
                .slideY(curve: Curves.decelerate, duration: 400.ms),
          ),
        ],
      ),
    );
  }
}

class IntroductionTile extends StatelessWidget {
  const IntroductionTile({super.key, required this.isSkillSection});
  final bool isSkillSection;
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: maxHeight * 0.01),
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.light.withOpacity(0.1),
              borderRadius: BorderRadius.circular(maxWidth * 0.005)),
          child: ListTile(
            leading: isSkillSection
                ? null
                : Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.light,
                    size: maxWidth * 0.01,
                  ),
            trailing: isSkillSection
                ? Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.light,
                    size: maxWidth * 0.01,
                  )
                : null,
            title: Text(
              'I did this and that and i will continue to do this and that',
              style: AppTextStyles.normal(context),
            ),
          )),
    );
  }
}
