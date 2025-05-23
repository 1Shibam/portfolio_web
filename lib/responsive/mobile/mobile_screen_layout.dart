import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/is_nav_open_provider.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/desktop/gradient_value_streams.dart';
import 'package:portfolio_web/responsive/mobile/about_page_mobile.dart';
import 'package:portfolio_web/responsive/mobile/project_page_mobile.dart';
import 'package:portfolio_web/responsive/nav_buttons_widget.dart';
import 'package:portfolio_web/responsive/tablet/contact_page_tab.dart';
import 'package:portfolio_web/responsive/tablet/experience_page_tablet.dart';
import 'package:portfolio_web/theme/colors.dart';

class MobileScreenLayout extends ConsumerStatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  ConsumerState<MobileScreenLayout> createState() => _TabletScreenLayoutState();
}

class _TabletScreenLayoutState extends ConsumerState<MobileScreenLayout> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    bool isNavOpen = ref.watch(isNavOpenProvider);

    // Navigate when selectedIndex changes
    ref.listen(selectedIndexProvider, (prev, next) {
      _pageController.jumpToPage(next);
      ref.read(isNavOpenProvider.notifier).state = false; // Close nav
    });
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
              color: Colors.black
                  .withValues(alpha: 0.05), // Adjust opacity as needed
            ),
          ),

          /// 3. **Foreground content**
          /// Page View for content
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // prevent swiping
            children: const [
              AboutPageMobile(),
              ProjectPageMobile(),
              ExperiencePageTab(),
              ContactPageTab(),
            ],
          ),

          /// Navigation drawer-like UI
          if (isNavOpen)
            Container(
              color: AppColors.background.withValues(alpha: 00.95),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: maxWidth * 0.2, vertical: maxHeight * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) => IconButton(
                              onPressed: () => ref
                                  .read(isNavOpenProvider.notifier)
                                  .state = false,
                              icon: Icon(
                                Icons.close,
                                color: AppColors.light,
                                size: maxHeight * 0.05,
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: maxWidth * 0.01,
                                vertical: maxHeight * 0.01),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.light),
                                borderRadius:
                                    BorderRadius.circular(maxHeight * 0.05)),
                            child: NavbarButtonsWidget(
                                selectedIndex: selectedIndex)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
