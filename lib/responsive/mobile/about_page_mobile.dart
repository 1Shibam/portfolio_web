import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/helper/is_nav_open_provider.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:web/web.dart' as web;

class AboutPageMobile extends ConsumerStatefulWidget {
  const AboutPageMobile({super.key});

  @override
  ConsumerState<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends ConsumerState<AboutPageMobile> {
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
    final mydata = ref.watch(userDataStateNotifierProvider);
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
                    horizontal: maxWidth * 0.02, vertical: maxHeight * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.light, width: 2),
                  borderRadius: BorderRadius.circular(0.05 * maxWidth),
                ),
                child: mydata.when(
                  data: (portfolioData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: portfolioData.about.length,
                            itemBuilder: (context, index) {
                              return IntroductionTile(
                                  isSkillSection: false,
                                  text: portfolioData.about[index]);
                            },
                          ),
                        ),
                        SizedBox(
                          height: maxHeight * 0.02,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              thickness: 2,
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: portfolioData.skills.length,
                            itemBuilder: (context, index) {
                              return IntroductionTile(
                                  isSkillSection: true,
                                  text: portfolioData.skills[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text(
                        'Something went wrong!!',
                        style: AppTextStyles.normal(context),
                      ),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.light,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
