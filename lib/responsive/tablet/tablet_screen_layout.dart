import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/colors.dart';

class TabletScreenLayout extends StatelessWidget {
  const TabletScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
        ),
        drawer: Drawer(
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
        ),
        body: null);
  }
}
