import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AsyncValueX, Consumer;
import 'package:portfolio_web/helper/is_nav_open_provider.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/animated_button.dart';
import 'package:web/web.dart' as web;

class AboutPageTab extends StatefulWidget {
  const AboutPageTab({
    super.key,
  });

  @override
  State<AboutPageTab> createState() => _AboutPageTabState();
}

class _AboutPageTabState extends State<AboutPageTab> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  //opne mail client directly ---
  void openMailClient() async {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'shivam55.dev@gmail.com', queryParameters: {
      'subject': 'Job opportunity for you shivam',
      'body':
          "Hi Shivam,\n\nJust went through your portfolio — solid work! If you're open to opportunities, we’d love to connect and talk more about how you can bring some of that magic to our team.\n\nLooking forward to hearing from you!"
    });
    web.window.open(emailLaunchUri.toString(), '_blank');
  }

  void openResume() async {
    const url =
        'https://drive.google.com/file/d/1RPfDWCohJ3bggkCnDAWZE_KrEoxWQBSa/view?usp=sharing';

    web.window.open(url, '_blank');
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('About', style: AppTextStyles.heading(context))
                  .animate()
                  .fade(duration: 1000.ms)
                  .slideX(curve: Curves.easeIn, duration: 400.ms),
              Consumer(
                builder: (context, ref, child) {
                  final isNavOpen = ref.watch(isNavOpenProvider);
                  return IconButton(
                    onPressed: () {
                      ref.read(isNavOpenProvider.notifier).state = !isNavOpen;
                    },
                    icon: Icon(
                      Icons.menu,
                      size: maxHeight * 0.06,
                      color: AppColors.light,
                    ),
                    splashRadius: 24,
                  ).animate().fade(duration: 1000.ms).slideX(
                        curve: Curves.easeIn,
                        duration: 400.ms,
                      );
                },
              )
            ],
          ),
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
                                      onPressed: () => openResume(),
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
                                      onPressed: () => openMailClient(),
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
