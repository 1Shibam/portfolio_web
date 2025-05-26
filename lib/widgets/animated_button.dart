import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton(
      {super.key,
      required this.isHovered,
      required this.maxWidth,
      required this.title,
      this.isMobile = false,
      this.onPressed});

  final bool isHovered;
  final double maxWidth;
  final String title;
  final bool? isMobile;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? Matrix4.translationValues(0, -6, 0) // Moves up slightly
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isHovered
              ? AppColors.light.withValues(alpha: 0.25)
              : AppColors.background.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(maxWidth * 0.01),
          border: Border.all(color: AppColors.light),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.light
                        .withValues(alpha: 0.4), // Soft glow effect
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Center(
          child: isMobile == true
              ? Text(title, style: AppTextStyles.medium(context))
              : Text(title, style: AppTextStyles.bold(context)),
        ),
      ),
    );
  }
}
