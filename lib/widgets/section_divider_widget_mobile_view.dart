import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/animated_button.dart';
import 'package:web/web.dart' as web;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SectionDividerWidgetMobileView extends StatefulWidget {
  const SectionDividerWidgetMobileView(
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
  State<SectionDividerWidgetMobileView> createState() =>
      _SectionDividerWidgetMobileViewState();
}

// Keep your imports unchanged

class _SectionDividerWidgetMobileViewState
    extends State<SectionDividerWidgetMobileView> {
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
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.light.withValues(alpha: 0.6), width: 1),
          borderRadius: BorderRadius.circular(0.01 * widget.maxWidth),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Project Name & Description
              Text(widget.projectName, style: AppTextStyles.bold(context)),
              SizedBox(height: widget.maxHeight * 0.01),
              Text(widget.projectDesc,
                  style: AppTextStyles.medium(context), softWrap: true),
              Divider(color: AppColors.light.withValues(alpha: 0.4)),

              /// Video Section
              SizedBox(height: widget.maxHeight * 0.02),
              widget.videoUrl.isEmpty
                  ? Center(
                      child: Text(
                        'You are on it',
                        style: AppTextStyles.heading2(context),
                      ),
                    )
                  : ClipRRect(
                      borderRadius:
                          BorderRadius.circular(widget.maxHeight * 0.02),
                      child: YoutubePlayer(
                        controller: controller,
                        aspectRatio: 16 / 9,
                      ),
                    ),

              Divider(color: AppColors.light.withValues(alpha: 0.4)),

              /// Tech Stack
              SizedBox(height: widget.maxHeight * 0.02),
              Text(widget.section2, style: AppTextStyles.normal(context)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.techStacks.length,
                itemBuilder: (context, index) {
                  return IntroductionTile(
                    isSkillSection: false,
                    text: widget.techStacks[index],
                  ).animate().fade(duration: 600.ms);
                },
              ),

              Divider(color: AppColors.light.withValues(alpha: 0.4)),

              /// Action Buttons
              SizedBox(height: widget.maxHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.downloadLink.isNotEmpty)
                    Flexible(
                      child: MouseRegion(
                        onEnter: (_) => setState(() => isHovered1 = true),
                        onExit: (_) => setState(() => isHovered1 = false),
                        child: AnimatedButton(
                          isHovered: isHovered1,
                          maxWidth: widget.maxWidth,
                          isMobile: true,
                          title: 'Download APK',
                          onPressed: () => openUrl(widget.downloadLink),
                        ),
                      ),
                    ).animate().fade(duration: 800.ms),
                  if (widget.downloadLink.isNotEmpty) const SizedBox.shrink(),
                  Flexible(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => isHovered2 = true),
                      onExit: (_) => setState(() => isHovered2 = false),
                      child: AnimatedButton(
                        isHovered: isHovered2,
                        maxWidth: widget.maxWidth,
                        isMobile: true,
                        title: 'Source Code',
                        onPressed: () => openUrl(widget.sourceCode),
                      ),
                    ),
                  ).animate().fade(duration: 800.ms),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
