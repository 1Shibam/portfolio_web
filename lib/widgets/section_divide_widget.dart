import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SectionDividerWidget extends StatefulWidget {
  const SectionDividerWidget({
    super.key,
    required this.maxHeight,
    required this.projectName,
    required this.projectDesc,
    required this.techStacks,
    required this.section1,
    required this.section2,
    required this.maxWidth,
  });

  final double maxHeight;
  final String projectName;
  final String projectDesc;
  final String section1;
  final String section2;
  final double maxWidth;
  final List<String> techStacks;

  @override
  State<SectionDividerWidget> createState() => _SectionDividerWidgetState();
}

class _SectionDividerWidgetState extends State<SectionDividerWidget> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.maxHeight * 0.02),
      child: Container(
        padding: EdgeInsets.all(widget.maxWidth * 0.03)
            .copyWith(bottom: widget.maxHeight * 0.015),
        height: widget.maxHeight * .75,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(0.01 * widget.maxWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.projectName,
                    style: AppTextStyles.bold(context),
                  ),
                  SizedBox(height: widget.maxHeight * 0.01),
                  Text(
                    widget.projectDesc,
                    maxLines: null,
                    style: AppTextStyles.medium(context),
                    softWrap: true,
                  ),
                  Divider(
                    color: AppColors.light.withOpacity(0.4),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.section1,
                          style: AppTextStyles.normal(context),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.maxWidth * 0.03,
                        vertical: widget.maxHeight * 0.01),
                    child: VerticalDivider(
                      color: AppColors.light.withOpacity(0.3),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.section2,
                          style: AppTextStyles.normal(context),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: widget.maxHeight * 0.01),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          2, // Adjust for responsiveness
                                      crossAxisSpacing: widget.maxWidth * 0.015,
                                      mainAxisSpacing: widget.maxHeight * 0.02,
                                      childAspectRatio: 2.6),
                              itemCount: widget.techStacks.length,
                              itemBuilder: (context, index) {
                                return IntrinsicHeight(
                                  child: TechStackCards(
                                    tech: widget.techStacks[index],
                                  ).animate().fade(duration: 600.ms),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.maxWidth * 0.03,
                        ),
                        child: MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              isHovered1 = true;
                            });
                          },
                          onExit: (event) => setState(() {
                            isHovered1 = false;
                          }),
                          child: AnimatedButton(
                            isHovered: isHovered1,
                            maxWidth: widget.maxWidth,
                            title: 'Downlaod APK',
                          ),
                        ),
                      ),
                    ).animate().fade(
                          duration: 800.ms,
                        ) // Staggered delay
                    ,
                    SizedBox(
                      width: widget.maxWidth * 0.05,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.maxWidth * 0.03,
                        ),
                        child: MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              isHovered2 = true;
                            });
                          },
                          onExit: (event) => setState(() {
                            isHovered2 = false;
                          }),
                          child: AnimatedButton(
                            isHovered: isHovered2,
                            maxWidth: widget.maxWidth,
                            title: 'Source-Code',
                          ),
                        ),
                      ),
                    ).animate().fade(
                          duration: 800.ms,
                        ) // Staggered delay
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class TechStackCards extends StatefulWidget {
  const TechStackCards({
    super.key,
    required this.tech,
  });
  final String tech;

  @override
  State<TechStackCards> createState() => _TechStackCardsState();
}

class _TechStackCardsState extends State<TechStackCards> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (event) => setState(() {
        isHovered = true;
      }),
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
            isHovered ? Matrix4.identity().scaled(1.005) : Matrix4.identity(),
        decoration: BoxDecoration(
            color: isHovered
                ? AppColors.light.withOpacity(0.3)
                : AppColors.light.withOpacity(0.1),
            borderRadius: BorderRadius.circular(maxWidth * 0.008)),
        padding: EdgeInsets.all(maxWidth * 0.0005),
        child: Center(
          child: Text(
            widget.tech,
            style: AppTextStyles.normal(context),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}




