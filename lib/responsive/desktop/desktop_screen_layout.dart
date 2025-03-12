import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/responsive/desktop/contact_section.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/responsive/desktop/project_section_widget.dart';
import 'package:portfolio_web/responsive/nav_buttons_widget.dart';
// Import your section widgets

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class DesktopScreenLayout extends ConsumerStatefulWidget {
  const DesktopScreenLayout({super.key});

  @override
  ConsumerState<DesktopScreenLayout> createState() =>
      _DesktopScreenLayoutState();
}

class _DesktopScreenLayoutState extends ConsumerState<DesktopScreenLayout> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Sync page view with state changes
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(selectedIndexProvider, (_, nextIndex) {
      if (_pageController.page?.round() != nextIndex) {
        _pageController.animateToPage(
          nextIndex,
          duration: 500.ms,
          curve: Curves.easeInOut,
        );
      }
    });
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient (keep your existing implementation)
          Consumer(
            builder: (context, ref, child) {
              // Your gradient implementation
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
          ),

          // Blur effect (keep your existing implementation)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.black.withOpacity(0.05),
            ),
          ),

          // Content and navigation
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Page View for sections
              Expanded(
                flex: 5,
                child: PageView(
                  controller: _pageController,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable swipe
                  children: const [
                    AboutPageDesktop(),
                    ProjectSectionWidget(),
                    ContactSection(),
                  ],
                ),
              ),

              // Navigation drawer
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.15 * maxHeight,
                  ).copyWith(right: maxWidth * 0.02),
                  child: Drawer(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: NavbarButtonsWidget(
                        selectedIndex: ref.watch(selectedIndexProvider),
                      ),
                    ),
                  ).animate().fade(duration: 400.ms).slideY(duration: 200.ms),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
