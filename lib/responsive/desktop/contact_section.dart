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
                _buildContactItem(
                    Icons.email, 'Email', 'your.email@example.com'),
                _buildContactItem(Icons.phone, 'Phone', '+91 1234567890'),
                _buildContactItem(
                    Icons.location_on, 'Location', 'Delhi, India'),
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

  Widget _buildContactItem(IconData icon, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                info,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
