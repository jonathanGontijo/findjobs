import 'package:findjobs/features/auth/presentation/ui/screens/home_screen/home_screen.dart';
import 'package:findjobs/features/auth/presentation/ui/screens/intro_screen/intro_screen.dart';
import 'package:findjobs/features/auth/presentation/ui/screens/signin_screen/siginin_screen.dart';
import 'package:findjobs/features/auth/presentation/ui/screens/signup_screen/signup_screen.dart';
import 'package:findjobs/features/auth/presentation/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

const splashScreen = "/splash-screen";
const introScreen = "/intro-screen";
const signInScreen = "/sign-in-screen";
const signUpScreen = "/sign-up-screen";
const homeScreen = "/home-screen";

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
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
      GoRoute(path: signInScreen, builder: (context, state) => SigininScreen()),
      GoRoute(
        path: signUpScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
