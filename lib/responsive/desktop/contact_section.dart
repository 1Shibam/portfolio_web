import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          Text(
            'Contact Me',
            style: AppTextStyles.heading(context),
          )
              .animate()
              .fade(duration: 1000.ms)
              .slideX(duration: 400.ms, curve: Curves.easeIn),
          SizedBox(height: maxHeight * 0.02),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(maxWidth * 0.01),
              color: Colors.black.withValues(alpha: 0.3),
              border: Border.all(color: AppColors.light.withValues(alpha: 0.3)),
            ),
            padding: EdgeInsets.all(maxWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContactItem(Icons.email, 'Email',
                    'shivam55.dev@gmail.com', maxHeight, maxWidth, context),
                _buildContactItem(Icons.phone, 'Phone', '+91-8178753392',
                    maxHeight, maxWidth, context),
                _buildContactItem(Icons.location_on, 'Location',
                    'Delhi-110093, India', maxHeight, maxWidth, context),
              ],
            ),
          )
              .animate()
              .fade(duration: 1000.ms)
              .slideY(duration: 400.ms, curve: Curves.decelerate),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String info,
      double maxHeight, double maxWidth, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: maxHeight * 0.01),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.light, size: maxHeight * 0.045),
              SizedBox(width: maxWidth * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info,
                    style: AppTextStyles.subheading(context),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColors.light,
          )
        ],
      ),
    );
  }
}
