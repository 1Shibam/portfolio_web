import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DesktopScreenLayout extends StatefulWidget {
  const DesktopScreenLayout({super.key});

  @override
  State<DesktopScreenLayout> createState() => _DesktopScreenLayoutState();
}

class _DesktopScreenLayoutState extends State<DesktopScreenLayout> {
  @override
  Widget build(BuildContext context) {
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
              print('i ran');
              print(
                  'Updating Gradient: radius=$radiusValue, center=$gradientCentre');
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.02 * maxWidth,
                    vertical: 0.1 * maxHeight,
                  ),
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
                          NavButton(title: 'About', onTap: () {}),
                          NavButton(title: 'Projects', onTap: () {}),
                          NavButton(title: 'Resume', onTap: () {}),
                          NavButton(title: 'Connect', onTap: () {}),
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
