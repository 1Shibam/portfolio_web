import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/responsive/desktop/desktop_screen_layout.dart';
import 'package:portfolio_web/responsive/nav_buttons.dart';

class TabDrawer extends ConsumerWidget {
  const TabDrawer({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context, ref) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.02 * maxWidth,
          vertical: 0.15 * maxHeight,
        ),
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: NavbarButtons(selectedIndex: selectedIndex),
          ),
        ),
      ),
    );
  }
}