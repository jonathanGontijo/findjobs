import 'package:findjobs/features/shared/components/custom_text.dart';
import 'package:flutter/material.dart';

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
                onPressed: () {},
                label: CustomText("Create an Account"),
                icon: Icon(Icons.add_circle_outline_outlined),
              ),
              SizedBox(height: 30),

              TextButton(onPressed: () {}, child: CustomText("Sign In")),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
