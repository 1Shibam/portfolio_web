import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const NavButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: maxHeight * 0.01),
        child: Container(
          decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 235, 251, 255).withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: AppColors.light, width: 2)
                  : null),
          padding:
              EdgeInsets.symmetric(vertical: 12, horizontal: maxWidth * 0.025),
          child: Text(
            title,
            style: AppTextStyles.normal(context),
          ),
        ).animate().fade(duration: 200.ms).slideY(duration: 400.ms),
      ),
    );
  }
}
