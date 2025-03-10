import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

// State provider for tracking selected index
final selectedIndexProvider = StateProvider<int>((ref) => 0);

class DesktopScreenLayout extends ConsumerStatefulWidget {
  const DesktopScreenLayout({super.key});

  @override
  ConsumerState<DesktopScreenLayout> createState() =>
      _DesktopScreenLayoutState();
}

class _DesktopScreenLayoutState extends ConsumerState<DesktopScreenLayout> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
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
              color: Colors.black.withOpacity(0.05), // Adjust opacity as needed
            ),
          ),

          /// 3. **Foreground content**
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    AboutPageDesktop(maxWidth: maxWidth, maxHeight: maxHeight),
                    const Center(
                      child: Text('this is project section'),
                    ),
                    const Center(
                      child: Text('this is Resume section'),
                    ),
                    const Center(
                      child: Text('this is contact section'),
                    ),
                  ],
                ),
              ),
              Expanded(
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
                              ref.read(selectedIndexProvider.notifier).state =
                                  0;
                            },
                            isSelected: selectedIndex == 0,
                          ),
                          NavButton(
                              title: 'Projects',
                              onTap: () {
                                ref.read(selectedIndexProvider.notifier).state =
                                    1;
                              },
                              isSelected: selectedIndex == 1),
                          NavButton(
                              title: 'Resume',
                              onTap: () {
                                ref.read(selectedIndexProvider.notifier).state =
                                    2;
                              },
                              isSelected: selectedIndex == 2),
                          NavButton(
                              title: 'Connect',
                              onTap: () {
                                ref.read(selectedIndexProvider.notifier).state =
                                    3;
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}


