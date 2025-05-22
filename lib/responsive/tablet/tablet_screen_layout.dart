import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/responsive/tablet/about_page_tablet.dart';
import 'package:portfolio_web/responsive/tablet/contact_page_tab.dart';
import 'package:portfolio_web/responsive/tablet/experience_page_tablet.dart';
import 'package:portfolio_web/responsive/tablet/projets_page_tab.dart';

class TabletScreenLayout extends ConsumerWidget {
  const TabletScreenLayout({super.key});

  @override
  Widget build(BuildContext context, ref) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                color: Colors.black
                    .withValues(alpha: 0.05), // Adjust opacity as needed
              ),
            ),

            /// 3. **Foreground content**
            IndexedStack(
              index: selectedIndex,
              children: const [
                AboutPageTab(),
                ProjectsPageTab(),
                ExperiencePageTab(),
                ContactPageTab()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
