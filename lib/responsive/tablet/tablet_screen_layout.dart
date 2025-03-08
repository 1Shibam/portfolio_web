import 'package:flutter/material.dart';


class TabletScreenLayout extends StatelessWidget {
  const TabletScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(),

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
