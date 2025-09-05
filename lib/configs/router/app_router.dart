import 'package:findjobs/features/auth/ui/screens/intro_screen/intro_screen.dart';
import 'package:findjobs/features/auth/ui/screens/signin_screen/siginin_screen.dart';
import 'package:findjobs/features/auth/ui/screens/signup_screen/signup_screen.dart';
import 'package:findjobs/features/auth/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const splashScreen = "/splash-screen";
const introScreen = "/intro-screen";
const signInScreen = "/sign-in-screen";
const signUpScreen = "/sign-up-screen";

final router = GoRouter(
  initialLocation: splashScreen,
  routes: [
    GoRoute(
      path: splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: introScreen,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: signInScreen,
      builder: (context, state) => const SigininScreen(),
    ),
    GoRoute(
      path: signUpScreen,
      builder: (context, state) => const SignupScreen(),
    ),
  ],
);
