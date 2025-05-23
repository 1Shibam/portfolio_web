import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/helper/data_provider.dart';
import 'package:portfolio_web/helper/is_nav_open_provider.dart';
import 'package:portfolio_web/theme/colors.dart';
import 'package:portfolio_web/theme/text_styles.dart';
import 'package:portfolio_web/widgets/section_divider_widget_mobile_view.dart';

class ProjectPageMobile extends ConsumerStatefulWidget {
  const ProjectPageMobile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectPageMobileState();
}

class _ProjectPageMobileState extends ConsumerState<ProjectPageMobile> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.05)
          .copyWith(top: maxHeight * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Projects',
                style: AppTextStyles.heading(context),
              )
                  .animate()
                  .fade(duration: 1000.ms)
                  .slideX(duration: 400.ms, curve: Curves.easeIn),
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
                child: Consumer(
                  builder: (context, ref, child) {
                    final userData = ref.watch(userDataStateNotifierProvider);
                    return userData.when(
                        data: (data) {
                          final projects = data.projects;

                          return ListView.builder(
                            controller: _scrollController,
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              final singleProj = projects[index];
                              return Padding(
                                padding:
                                    EdgeInsets.only(bottom: 0.02 * maxHeight),
                                child: SectionDividerWidgetMobileView(
                                    maxHeight: maxHeight,
                                    projectName: singleProj.name,
                                    projectDesc: singleProj.description,
                                    techStacks: singleProj.technologies,
                                    section1: singleProj.demo == ""
                                        ? "Live-Demo"
                                        : 'Video-Demo',
                                    section2: 'Technologies-Used',
                                    maxWidth: maxWidth,
                                    sourceCode: singleProj.github,
                                    downloadLink: singleProj.downlaodLink,
                                    videoUrl: singleProj.demo),
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) => const Center(
                              child: Text('Something went wrong sorry!!'),
                            ),
                        loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ));
                  },
                )),
          )
              .animate()
              .fade(duration: 1000.ms)
              .slideY(duration: 400.ms, curve: Curves.decelerate),
        ],
      ),
    );
  }
}
