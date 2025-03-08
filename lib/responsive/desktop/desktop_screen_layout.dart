import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

class DesktopScreenLayout extends StatelessWidget {
  const DesktopScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            child: Drawer(
          shape: const RoundedRectangleBorder(),
          backgroundColor: AppColors.lightBlue,
          child: ListView(
            children: const [
              ListTile(
                title: Text('About'),
              ),
              ListTile(
                title: Text('Projects'),
              ),
              ListTile(
                title: Text('Resume'),
              ),
              ListTile(
                title: Text('Contact'),
              ),
            ],
          ),
        )),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.darkBlue,
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Container(
                    color: AppColors.lightBlue,
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
