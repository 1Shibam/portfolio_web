import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/section_divide_widget.dart';

class ProjectSectionWidget extends StatefulWidget {
  const ProjectSectionWidget({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
  });

  final double maxHeight;
  final double maxWidth;

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
    return Column(
      children: [
        SizedBox(
          height: widget.maxHeight * 0.1,
        ),
        Expanded(
          child: Scrollbar(
            interactive: true,
            controller: _scrollController,
            thickness: widget.maxWidth * 0.01,
            thumbVisibility: true, // Always show the scrollbar
            trackVisibility: true,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SectionDividerWidget(
                      maxWidth: widget.maxWidth,
                      maxHeight: widget.maxHeight,
                      title1: 'video Source',
                      title2: 'Tech-Stacks'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
