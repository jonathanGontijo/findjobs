import 'package:findjobs/features/shared/components/components.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText("te.", fontSize: 150),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
