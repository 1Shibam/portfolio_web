import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';



// State provider for tracking selected index
final selectedIndexProvider = StateProvider<int>((ref) => 0);


class DesktopScreenLayout extends ConsumerStatefulWidget {
  const DesktopScreenLayout({super.key});

  @override
  ConsumerState<DesktopScreenLayout> createState() => _DesktopScreenLayoutState();
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
                    const Center(child: Text('this is project section'),),
                const Center(child: Text('this is Resume section'),),
                const Center(child: Text('this is contact section'),),
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
                              setState(() => selectedIndex = 0);
                            },
                            isSelected: selectedIndex == 0,
                          ),
                          NavButton(
                              title: 'Projects',
                              onTap: () {
                                setState(() => selectedIndex = 1);
                              },
                              isSelected: selectedIndex == 1),
                          NavButton(
                              title: 'Resume',
                              onTap: () {
                                setState(() => selectedIndex = 2);
                              },
                              isSelected: selectedIndex == 2),
                          NavButton(
                              title: 'Connect',
                              onTap: () {
                                setState(() => selectedIndex = 3);
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

class AboutPageDesktop extends StatelessWidget {
  const AboutPageDesktop({
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
      ).copyWith(top: maxHeight * 0.1, bottom: maxHeight * 0.02),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light, width: 2),
          borderRadius: BorderRadius.circular(0.05 * maxWidth),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Center(
                  child: Text('This is about me rells speasking')),
            ),
            SizedBox(
              height: maxHeight * 0.6,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: VerticalDivider(
                  thickness: 2,
                  color: AppColors.light,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                    'This is where I put my skills I don’t have'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
