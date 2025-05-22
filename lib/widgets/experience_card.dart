import 'package:flutter/material.dart';
import 'package:portfolio_web/model/data_model.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(experience.title, style: AppTextStyles.heading2(context)),
        const SizedBox(height: 4),
        Text(
          '${experience.company} • ${experience.duration}',
          style: AppTextStyles.subheading2(context),
        ),
        const SizedBox(height: 16),
        ...experience.responsibilities.map(
          (resp) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: AppTextStyles.normal(context)),
                Expanded(
                    child: Text(resp, style: AppTextStyles.normal(context))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
