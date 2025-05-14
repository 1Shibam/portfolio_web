import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';

class AboutPageDesktop extends StatefulWidget {
  const AboutPageDesktop({
    super.key,
  });

  @override
  State<AboutPageDesktop> createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop> {
  bool isHovered1 = false;
  bool isHovered2 = false;
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
          Text('About', style: AppTextStyles.heading(context))
              .animate()
              .fade(duration: 1000.ms)
              .slideX(curve: Curves.easeIn, duration: 400.ms),
          SizedBox(height: maxHeight * 0.02),
          Expanded(
            child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: maxWidth * 0.01,
                    ).copyWith(top: maxHeight * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      border: Border.all(
                        color: AppColors.light.withValues(alpha: 0.6),
                      ),
                      borderRadius: BorderRadius.circular(0.01 * maxWidth),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Consumer(
                            builder: (context, ref, child) {
                              final userData =
                                  ref.watch(userDataStateNotifierProvider);
                              return userData.when(
                                  data: (myData) {
                                    final List<String> aboutList = myData.about;
                                    final List<String> allSkills =
                                        myData.skills;

                                    return IntroAndSkillsSectoin(
                                        aboutList: aboutList,
                                        maxHeight: maxHeight,
                                        allSkills: allSkills);
                                  },
                                  error: (error, stackTrace) {
                                    return const Text('Something is wrong');
                                  },
                                  loading: () => const Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        ),
                        Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: maxWidth * 0.03,
                                      vertical: maxHeight * 0.02),
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
                                      maxWidth: maxWidth,
                                      title: 'Resume',
                                    ),
                                  ),
                                ),
                              )
                                  .animate()
                                  .fade(
                                      duration: 800.ms,
                                      delay: (900).ms) // Staggered delay
                                  .slideX(
                                      begin: -1,
                                      curve: Curves.easeInOut,
                                      duration: 600.ms,
                                      delay: (900).ms),
                              SizedBox(
                                width: maxWidth * 0.05,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: maxWidth * 0.03,
                                      vertical: maxHeight * 0.02),
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
                                      maxWidth: maxWidth,
                                      title: 'Hire-Me',
                                    ),
                                  ),
                                ),
                              )
                                  .animate()
                                  .fade(
                                      duration: 800.ms,
                                      delay: (900).ms) // Staggered delay
                                  .slideX(
                                    begin: 1,
                                    curve: Curves.easeInOut,
                                    duration: 600.ms,
                                    delay: (900).ms,
                                  ),
                            ]))
                      ],
                    ))
                .animate()
                .fade(duration: 1000.ms)
                .slideY(curve: Curves.decelerate, duration: 400.ms),
          ),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  const AnimatedButton(
      {super.key,
      required this.isHovered,
      required this.maxWidth,
      required this.title});

  final bool isHovered;
  final double maxWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: isHovered
          ? Matrix4.translationValues(0, -6, 0) // Moves up slightly
          : Matrix4.identity(),
      decoration: BoxDecoration(
        color: isHovered
            ? AppColors.light.withValues(alpha: 0.25)
            : AppColors.background.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(maxWidth * 0.01),
        border: Border.all(color: AppColors.light),
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: AppColors.light
                      .withValues(alpha: 0.4), // Soft glow effect
                  blurRadius: 6,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: Center(
        child: Text(title, style: AppTextStyles.bold(context)),
      ),
    );
  }
}

class IntroAndSkillsSectoin extends StatelessWidget {
  const IntroAndSkillsSectoin({
    super.key,
    required this.aboutList,
    required this.maxHeight,
    required this.allSkills,
  });

  final List<String> aboutList;
  final double maxHeight;
  final List<String> allSkills;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: AppTextStyles.bold(context),
            ),
            Expanded(
              child: ListView(
                children: List.generate(aboutList.length, (index) {
                  final singleString = aboutList[index];
                  return IntroductionTile(
                    text: singleString,
                    isSkillSection: false,
                  )
                      .animate()
                      .fade(
                          duration: 600.ms,
                          delay: (index * 200).ms) // Staggered delay
                      .slideX(
                          curve: Curves.easeInOut,
                          duration: 500.ms,
                          delay: (index * 200).ms);
                }).toList(),
              ),
            )
          ],
        )),
        SizedBox(
          height: maxHeight * 0.6,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: VerticalDivider(
              thickness: 2,
              color: AppColors.light,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: AppTextStyles.bold(context),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: allSkills.length,
                itemBuilder: (context, index) {
                  final String singleSkill = allSkills[index];
                  return IntroductionTile(
                    text: singleSkill,
                    isSkillSection: true,
                  )
                      .animate()
                      .fade(
                          duration: 600.ms,
                          delay: (index * 200).ms) // Staggered delay
                      .slideX(
                          begin: 1,
                          curve: Curves.easeInOut,
                          duration: 500.ms,
                          delay: (index * 200).ms);
                },
              ))
            ],
          ),
        ),
      ],
    );
  }
}

class IntroductionTile extends StatefulWidget {
  const IntroductionTile(
      {super.key, required this.isSkillSection, required this.text});
  final bool isSkillSection;
  final String text;

  @override
  State<IntroductionTile> createState() => _IntroductionTileState();
}

class _IntroductionTileState extends State<IntroductionTile> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: maxHeight * 0.01),
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovered = true;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
        }),
        child: AnimatedContainer(
            duration: const Duration(microseconds: 100),
            transform: isHovered
                ? Matrix4.identity().scaled(1.005)
                : Matrix4.identity(),
            decoration: BoxDecoration(
                color: isHovered
                    ? AppColors.light.withValues(alpha: 0.25)
                    : AppColors.light.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(maxWidth * 0.005)),
            child: ListTile(
              tileColor: isHovered
                  ? AppColors.light.withValues(alpha: 0.25)
                  : AppColors.light.withValues(alpha: 0.1),
              leading: widget.isSkillSection
                  ? null
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.light,
                      size: maxWidth * 0.01,
                    ),
              trailing: widget.isSkillSection
                  ? Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.light,
                      size: maxWidth * 0.01,
                    )
                  : null,
              title: Text(
                widget.text,
                style: AppTextStyles.normal(context),
              ),
            )),
      ),
    );
  }
}
