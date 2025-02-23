import 'package:flutter/material.dart';
import 'package:portfolio_web/themes/colors.dart';
import 'package:portfolio_web/themes/text_styles.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 1,
        shadowColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.dashboard,
              color: AppColors.secondaryText,
            ),
            const SizedBox(
              width: 16,
            ),
            RichText(
                text: TextSpan(
                    text: 'SHIVAM ',
                    style: Theme.of(context).textTheme.headlineMedium,
                    children: [
                  TextSpan(
                      text: '/ Application Developer',
                      style: Theme.of(context).textTheme.headlineSmall)
                ]))
          ],
        ),
        actions: [
          CustomTextButtons(
            text: 'About Me',
            onPressed: () {},
          ),
          CustomTextButtons(
            text: 'Resume',
            onPressed: () {},
          ),
          CustomTextButtons(
            text: 'Project',
            onPressed: () {},
          ),
          CustomTextButtons(
            text: 'Contact',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(
          'This is Web Screen my nigga',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class CustomTextButtons extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomTextButtons({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: AppTextStyles.button,
          )),
    );
  }
}
