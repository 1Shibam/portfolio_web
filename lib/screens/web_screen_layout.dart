import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.dashboard,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
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
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          )),
    );
  }
}
