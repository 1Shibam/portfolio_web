import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/animated_button.dart';
import 'package:web/web.dart' as web;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SectionDividerWidget extends StatefulWidget {
  const SectionDividerWidget(
      {super.key,
      required this.maxHeight,
      required this.projectName,
      required this.projectDesc,
      required this.techStacks,
      required this.section1,
      required this.section2,
      required this.maxWidth,
      required this.sourceCode,
      required this.downloadLink,
      required this.videoUrl});

  final double maxHeight;
  final String projectName;
  final String projectDesc;
  final String section1;
  final String section2;
  final double maxWidth;
  final List<String> techStacks;
  final String sourceCode;
  final String downloadLink;
  final String videoUrl;

  @override
  State<SectionDividerWidget> createState() => _SectionDividerWidgetState();
}

class _SectionDividerWidgetState extends State<SectionDividerWidget> {
  bool isHovered1 = false;
  bool isHovered2 = false;

  void openUrl(String url) async {
    web.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final videoId =
        widget.videoUrl == "" ? "" : widget.videoUrl.split('.be/')[1];
    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: widget.maxHeight * 0.02),
      child: Container(
        padding: EdgeInsets.all(widget.maxWidth * 0.03)
            .copyWith(bottom: widget.maxHeight * 0.015),
        height: widget.maxHeight * .75,
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.light.withValues(alpha: 0.6), width: 1),
          borderRadius: BorderRadius.circular(0.01 * widget.maxWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
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
                    color: AppColors.light.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.section1,
                          style: AppTextStyles.normal(context),
                        ),
                        widget.videoUrl == ""
                            ? Expanded(
                                child: Center(
                                  child: Text(
                                    'You are on it',
                                    style: AppTextStyles.heading2(context),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        widget.maxHeight * 0.04),
                                    child: YoutubePlayer(
                                      controller: controller,
                                      aspectRatio: 16 / 9,
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.maxWidth * 0.03,
                        vertical: widget.maxHeight * 0.01),
                    child: VerticalDivider(
                      color: AppColors.light.withValues(alpha: 0.3),
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
                              child: ListView.builder(
                                itemCount: widget.techStacks.length,
                                itemBuilder: (context, index) {
                                  return IntroductionTile(
                                          isSkillSection: false,
                                          text: widget.techStacks[index])
                                      .animate()
                                      .fade(duration: 600.ms);
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.maxHeight * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    widget.downloadLink == ""
                        ? const SizedBox.shrink()
                        : Expanded(
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
                                  onPressed: () => openUrl(widget.downloadLink),
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
                            onPressed: () => openUrl(widget.sourceCode),
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
    double maxHeight = MediaQuery.of(context).size.height;
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
                ? AppColors.light.withValues(alpha: 0.3)
                : AppColors.light.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(maxWidth * 0.008)),
        padding: EdgeInsets.symmetric(
            horizontal: maxWidth * 0.000001, vertical: maxHeight * 0.0001),
        child: Center(
          child: Text(
            widget.tech,
            style: AppTextStyles.normal(context),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible, // Prevent clippin
          ),
        ),
      ),
    );
  }
}
