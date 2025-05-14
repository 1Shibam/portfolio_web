import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:web/web.dart' as web;

class NavbarButtonsWidget extends ConsumerStatefulWidget {
  const NavbarButtonsWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  ConsumerState<NavbarButtonsWidget> createState() =>
      _NavbarButtonsWidgetState();
}

class _NavbarButtonsWidgetState extends ConsumerState<NavbarButtonsWidget> {
  List<bool> isHovered = List.generate(5, (index) => false);
  void openUrl(String url) {
    web.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    final List<String> socialImages = [
      'assets/icons/linkedin-svgrepo-com.svg',
      'assets/icons/github-svgrepo-com.svg',
      'assets/icons/leetcode-svgrepo-com.svg',
    ];

//my social urls to put on on click ---
    final List<String> socialUrls = [
      'https://www.linkedin.com/in/sh1vamm/',
      'https://github.com/1Shibam',
      'https://leetcode.com/u/shibammm/',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Navigation Buttons
        for (int i = 0; i < 3; i++)
          NavButton(
            title: ['About', 'Projects', 'Contact'][i],
            onTap: () {
              ref.read(selectedIndexProvider.notifier).state = i;
            },
            isSelected: widget.selectedIndex == i,
          ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(
            color: AppColors.light,
            thickness: 2,
          ),
        ),

        // Social Icons
        Padding(
          padding: EdgeInsets.only(top: maxHeight * 0.02),
          child: Wrap(
            spacing: maxWidth * 0.02,
            runSpacing: maxHeight * 0.02,
            alignment: WrapAlignment.center,
            children: List.generate(socialImages.length, (index) {
              return MouseRegion(
                onEnter: (_) => setState(() => isHovered[index] = true),
                onExit: (_) => setState(() => isHovered[index] = false),
                child: GestureDetector(
                  onTap: () {
                    openUrl(socialUrls[index]);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.all(isHovered[index] ? 10 : 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: isHovered[index]
                          ? [
                              BoxShadow(
                                color: AppColors.light.withValues(alpha: 0.5),
                                blurRadius: 10,
                                spreadRadius: 5,
                              )
                            ]
                          : [],
                    ),
                    child: SvgPicture.asset(
                      socialImages[index],
                      height: maxHeight * 0.06,
                      width: maxHeight * 0.06,
                      fit: BoxFit.contain,
                      colorFilter: isHovered[index]
                          ? const ColorFilter.mode(
                              AppColors.light, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: maxHeight * 0.05),
      ],
    );
  }
}
