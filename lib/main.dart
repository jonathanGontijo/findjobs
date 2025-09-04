import 'package:findjobs/configs/theme/app_theme.dart';
import 'package:findjobs/features/auth/ui/screens/intro_screen/intro_screen.dart';
import 'package:findjobs/features/auth/ui/screens/signin_screen/siginin_screen.dart';
import 'package:findjobs/features/auth/ui/screens/signup_screen/signup_screen.dart';
import 'package:findjobs/features/auth/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'te.',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(true),
      home: SignupScreen(),
    );
  }
}
