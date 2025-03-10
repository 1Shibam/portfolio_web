
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/colors.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.05, vertical: maxHeight * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resume',
            style: TextStyle(
              fontSize: maxWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: AppColors.light,
            ),
          ).animate().fade(duration: 500.ms).slideY(),
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
                _buildResumeItem('Education', 'Bachelor\'s in Computer Science', '2021 - 2025'),
                _buildResumeItem('Experience', 'Flutter Developer Intern', '6 months'),
                _buildResumeItem('Skills', 'Flutter, Dart, Firebase, REST APIs'),
              ],
            ),
          ).animate().fade(duration: 800.ms).slideY(),
        ],
      ),
    );
  }

  Widget _buildResumeItem(String title, String subtitle, [String? duration]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
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
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          if (duration != null)
            Text(
              duration,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}