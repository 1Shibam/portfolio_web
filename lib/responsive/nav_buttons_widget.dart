import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/theme/colors.dart';

class NavbarButtonsWidget extends ConsumerWidget {
  const NavbarButtonsWidget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NavButton(
          title: 'About',
          onTap: () {
            ref.read(selectedIndexProvider.notifier).state = 0;
          },
          isSelected: selectedIndex == 0,
        ),
        NavButton(
            title: 'Projects',
            onTap: () {
              ref.read(selectedIndexProvider.notifier).state = 1;
            },
            isSelected: selectedIndex == 1),
        NavButton(
            title: 'Connect',
            onTap: () {
              ref.read(selectedIndexProvider.notifier).state = 2;
            },
            isSelected: selectedIndex == 2),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(
            color: AppColors.light,
            thickness: 2,
          ),
        )
      ],
    );
  }
}
