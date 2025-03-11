import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/section_divide_widget.dart';

class ProjectSectionWidget extends StatefulWidget {
  const ProjectSectionWidget({
    super.key,
  });

  @override
  State<ProjectSectionWidget> createState() => _ProjectSectionWidgetState();
}

class _ProjectSectionWidgetState extends State<ProjectSectionWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: maxWidth * 0.05, vertical: maxHeight * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: AppTextStyles.heading(context),
          ).animate().fade(duration: 500.ms).slideY(),
          SizedBox(
            height: maxHeight * 0.02,
          ),
          Expanded(
            child: Scrollbar(
              interactive: true,
              controller: _scrollController,
              thickness: maxWidth * 0.01,
              thumbVisibility: true, // Always show the scrollbar
              trackVisibility: true,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 0.02 * maxWidth),
                    child: SectionDividerWidget(
                        maxWidth: maxWidth,
                        maxHeight: maxHeight,
                        title1: 'video Source',
                        title2: 'Tech-Stacks'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
