import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/experience_card.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: maxWidth * 0.05,
        vertical: maxHeight * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: AppTextStyles.heading(context),
          )
              .animate()
              .fade(duration: 1000.ms)
              .slideX(duration: 400.ms, curve: Curves.easeIn),
          SizedBox(height: maxHeight * 0.02),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(maxWidth * 0.01),
              color: Colors.black.withAlpha(30),
              border: Border.all(color: AppColors.light.withAlpha(30)),
            ),
            padding: EdgeInsets.all(maxWidth * 0.03),
            child: Consumer(
              builder: (context, ref, child) {
                final userdata = ref.watch(userDataStateNotifierProvider);
                return userdata.when(
                  data: (data) {
                    if (data.experience.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'No Experience is added yet',
                          style: AppTextStyles.medium(context),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.experience.length,
                      itemBuilder: (context, index) {
                        return ExperienceCard(
                          experience: data.experience[index],
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text(
                      'Something went wrong',
                      style: AppTextStyles.heading2(context),
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.light,
                    ),
                  ),
                );
              },
            ),
          )
              .animate()
              .fade(duration: 1000.ms)
              .slideY(duration: 400.ms, curve: Curves.decelerate),
        ],
      ),
    );
  }
}
