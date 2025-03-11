import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

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
          Text('Resume', style: AppTextStyles.heading(context))
              .animate()
              .fade(duration: 500.ms)
              .slideY(),
          SizedBox(height: maxHeight * 0.02),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.3),
              border: Border.all(color: AppColors.light.withOpacity(0.3)),
            ),
            padding: EdgeInsets.all(maxWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildResumeItem(
                  'Education',
                  'Bachelor\'s in Computer Science',
                  context,
                  '2021 - 2025',
                ),
                _buildResumeItem('Experience', 'Flutter Developer Intern',
                    context, '6 months'),
                _buildResumeItem(
                    'Skills', 'Flutter, Dart, Firebase, REST APIs', context),
              ],
            ),
          ).animate().fade(duration: 800.ms).slideY(),
        ],
      ),
    );
  }

  Widget _buildResumeItem(String title, String subtitle, BuildContext context,
      [String? duration]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.bold(context)),
          Text(
            subtitle,
            style: AppTextStyles.subheading2(context),
          ),
          if (duration != null)
            Text(
              duration,
              style: AppTextStyles.normal(context),
            ),
          Divider(color: AppColors.light.withOpacity(0.3)),
        ],
      ),
    );
  }
}
