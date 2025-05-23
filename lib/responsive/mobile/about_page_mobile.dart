import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/helper/is_nav_open_provider.dart';
import 'package:portfolio_web/responsive/desktop/about_page_desktop.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/animated_button.dart';
import 'package:web/web.dart' as web;

class AboutPageMobile extends ConsumerStatefulWidget {
  const AboutPageMobile({super.key});

  @override
  ConsumerState<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends ConsumerState<AboutPageMobile> {
  bool isHovered1 = false;
  bool isHovered2 = false;

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
          // Title + Menu
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

          // Main Scrollable Container
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
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Introduction Section
                        Text("Introduction",
                            style: AppTextStyles.bold(context)),
                        SizedBox(height: maxHeight * 0.005),
                        ...portfolioData.about.map((text) => IntroductionTile(
                            isSkillSection: false, text: text)),

                        SizedBox(height: maxHeight * 0.02),
                        const Divider(
                          thickness: 2,
                          color: AppColors.light,
                        ),
                        SizedBox(height: maxHeight * 0.02),

                        // Skills Section
                        Text("Skills", style: AppTextStyles.bold(context)),
                        SizedBox(height: maxHeight * 0.005),
                        ...portfolioData.skills.map((text) =>
                            IntroductionTile(isSkillSection: true, text: text)),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(
                    'Something went wrong!!',
                    style: AppTextStyles.normal(context),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.light),
                ),
              ),
            ),
          ),

          SizedBox(height: maxHeight * 0.02),

          // Bottom Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                onEnter: (_) => setState(() => isHovered1 = true),
                onExit: (_) => setState(() => isHovered1 = false),
                child: SizedBox(
                  width: maxWidth * 0.35,
                  height: maxHeight * 0.06,
                  child: AnimatedButton(
                    isHovered: isHovered1,
                    maxWidth: maxWidth,
                    title: 'Resume',
                    onPressed: openResume,
                  ),
                ),
              ),
              MouseRegion(
                onEnter: (_) => setState(() => isHovered2 = true),
                onExit: (_) => setState(() => isHovered2 = false),
                child: SizedBox(
                  width: maxWidth * 0.35,
                  height: maxHeight * 0.06,
                  child: AnimatedButton(
                    isHovered: isHovered2,
                    maxWidth: maxWidth,
                    title: 'Hire Me',
                    onPressed: openMailClient,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
