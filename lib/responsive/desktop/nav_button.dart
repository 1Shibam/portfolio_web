import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const NavButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.01, horizontal: maxWidth * 0.015),
          child: MouseRegion(
            onEnter: (event) => setState(() {
              isHovered = true;
            }),
            onExit: (event) => setState(() {
              isHovered = false;
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              transform: isHovered || widget.isSelected
                  ? Matrix4.translationValues(0, -3, 0) // Moves up slightly
                  : Matrix4.identity(),
              decoration: BoxDecoration(
                color: isHovered || widget.isSelected
                    ? AppColors.light
                        .withValues(alpha: 0.1) // Same as selected color
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isHovered || widget.isSelected
                    ? Border.all(
                        color: AppColors.light,
                        width: 1) // Add the selected border effect
                    : null,
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.light
                              .withValues(alpha: 0.5), // Soft glow effect
                          blurRadius: 6,
                          spreadRadius: 1,
                        )
                      ]
                    : [],
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 12, horizontal: maxWidth * 0.025),
              child: Center(
                child: Text(
                  widget.title,
                  style: AppTextStyles.normal(context),
                ),
              ),
            ).animate().fade(duration: 200.ms).slideY(duration: 400.ms),
          ),
        ),
      ),
    );
  }
}
