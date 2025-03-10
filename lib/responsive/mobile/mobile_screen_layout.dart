import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/theme/colors.dart';

class MobileScreenLayout extends ConsumerStatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  ConsumerState<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends ConsumerState<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * .1),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Ensure it's a proper button shape
                  color: Colors.transparent,
                  // Optional: change if needed
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: maxHeight * 0.06,
                    color: AppColors.light,
                  ),
                  splashRadius: 24, // Reduces weird large tap effects
                  constraints: const BoxConstraints(), // Removes weird padding
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: maxWidth * 0.02, vertical: maxHeight * 0.02),
        child: Stack(
          children: [
            /// 1. **Background with the animated gradient**
            Consumer(
              builder: (context, ref, child) {
                final radiusValue = ref.watch(radiusProvider).value ?? 0.3;
                final gradientCentre =
                    ref.watch(gradientCenterProvider).value ?? Alignment.center;
                return AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      tileMode: TileMode.repeated,
                      center: gradientCentre,
                      radius: radiusValue,
                      focalRadius: 300,
                      transform: const GradientRotation(0),
                      colors: const [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(255, 29, 29, 29)
                      ],
                    ),
                  ),
                );
              },
            )
                .animate()
                .fade(duration: 500.ms)
                .scaleXY(end: 1.02, duration: 500.ms),

            /// 2. **Apply blur effect to everything below**
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                color:
                    Colors.black.withOpacity(0.05), // Adjust opacity as needed
              ),
            ),

            /// 3. **Foreground content**
            IndexedStack(
              index: selectedIndex,
              children: [
                AboutPageMobile(maxWidth: maxWidth, maxHeight: maxHeight),
                const Center(child: Text('this is project section'),),
                const Center(child: Text('this is Resume section'),),
                const Center(child: Text('this is contact section'),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPageMobile extends StatelessWidget {
  const AboutPageMobile({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.02 * maxWidth,
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light, width: 2),
          borderRadius: BorderRadius.circular(0.05 * maxWidth),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(child: Text('This is about me rells speasking')),
            ),
            SizedBox(
              height: maxHeight * 0.6,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 2,
                  color: AppColors.light,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text('This is where I put my skills I don’t have'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabDrawer extends ConsumerWidget {
  const TabDrawer({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context, ref) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.02 * maxWidth,
          vertical: 0.15 * maxHeight,
        ),
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
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
                    title: 'Resume',
                    onTap: () {
                      ref.read(selectedIndexProvider.notifier).state = 2;
                    },
                    isSelected: selectedIndex == 2),
                NavButton(
                    title: 'Connect',
                    onTap: () {
                      ref.read(selectedIndexProvider.notifier).state = 0;
                    },
                    isSelected: selectedIndex == 3),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    color: AppColors.light,
                    thickness: 2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
