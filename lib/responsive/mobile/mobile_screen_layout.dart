import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/responsive/mobile/about_page_mobile.dart';

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






