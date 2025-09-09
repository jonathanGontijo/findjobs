import 'package:findjobs/configs/configs.dart';
import 'package:findjobs/features/shared/components/custom_text.dart';
import 'package:findjobs/features/shared/helpers/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              CustomText("te.", fontSize: 150),
              Spacer(),
              FilledButton.icon(
                onPressed: () => {context.push(signUpScreen)},
                label: CustomText("Create an Account"),
                icon: Icon(Icons.add_circle_outline_outlined),
              ),
              30.height,
              TextButton(
                onPressed: () => {context.push(signInScreen)},
                child: CustomText("Sign In"),
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
