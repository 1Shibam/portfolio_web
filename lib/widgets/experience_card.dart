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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(maxWidth * 0.01),
        color: Colors.black.withAlpha(30),
        border: Border.all(color: AppColors.light.withAlpha(30)),
      ),
      padding: EdgeInsets.all(maxWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(experience.title, style: AppTextStyles.heading2(context)),
          const SizedBox(height: 4),
          Text(
            '${experience.company} • ${experience.duration}',
            style: AppTextStyles.subheading2(context),
          ),
          SizedBox(height: maxHeight * 0.05),
          ...experience.responsibilities.map(
            (resp) => Padding(
              padding: EdgeInsets.symmetric(vertical: maxHeight * 0.01),
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
      ),
    );
  }
}
