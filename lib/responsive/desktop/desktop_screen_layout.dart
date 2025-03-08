import 'package:flutter/material.dart';
import 'package:portfolio_web/responsive/desktop/nav_button.dart';
import 'package:portfolio_web/theme/colors.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.clamp,
            center: Alignment.bottomCenter,
            radius: 0.9,
            focalRadius: 1,
            transform: GradientRotation(0),
            colors: [AppColors.surface, AppColors.background],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.05 * maxWidth,
                  vertical: 0.15 * maxHeight,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.light),
                    borderRadius: BorderRadius.circular(0.05 * maxWidth),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('This is about me rells speasking'),
                      ),
                      SizedBox(
                        height: maxHeight * 0.3, // Ensures proper height
                        child: VerticalDivider(
                          thickness: 4,
                          color: AppColors.light,
                        ),
                      ),
                      Expanded(
                        child:
                            Text('This is where I put my skills I don’t have'),
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
                            thickness: 5,
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
      ),
    );
  }
}
