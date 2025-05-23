import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/helper/is_nav_open_provider.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/experience_card.dart';

class ExperiencePageTab extends StatefulWidget {
  const ExperiencePageTab({super.key});

  @override
  State<ExperiencePageTab> createState() => _ExperiencePageTabState();
}

class _ExperiencePageTabState extends State<ExperiencePageTab> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Experience',
                style: AppTextStyles.heading(context),
              )
                  .animate()
                  .fade(duration: 1000.ms)
                  .slideX(duration: 400.ms, curve: Curves.easeIn),
              Consumer(
                builder: (context, ref, child) {
                  final isNavOpen = ref.watch(isNavOpenProvider);
                  return IconButton(
                    onPressed: () {
                      ref.read(isNavOpenProvider.notifier).state = !isNavOpen;
                    },
                    icon: Icon(
                      Icons.menu,
                      size: maxHeight * 0.06,
                      color: AppColors.light,
                    ),
                    splashRadius: 24,
                  ).animate().fade(duration: 1000.ms).slideX(
                        curve: Curves.easeIn,
                        duration: 400.ms,
                      );
                },
              )
            ],
          ),
          SizedBox(height: maxHeight * 0.02),
          Consumer(
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
          )
              .animate()
              .fade(duration: 1000.ms)
              .slideY(duration: 400.ms, curve: Curves.decelerate),
        ],
      ),
    );
  }
}
