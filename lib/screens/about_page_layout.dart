import 'package:flutter/widgets.dart';

class AboutPageLayout extends StatelessWidget {
  const AboutPageLayout(
      {super.key,
      required this.desktopAbout,
      required this.tabletAbout,
      required this.mobileAbout});

  final Widget desktopAbout;
  final Widget tabletAbout;
  final Widget mobileAbout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= 1280) {
          return desktopAbout;
        } else if (width < 1280 && width >= 768) {
          return tabletAbout;
        } else {
          return mobileAbout;
        }
      },
    );
  }
}
