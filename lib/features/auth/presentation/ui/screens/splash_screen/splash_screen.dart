import 'package:findjobs/configs/router/app_router.dart';
import 'package:findjobs/features/auth/presentation/providers/authentication_provider.dart';
import 'package:findjobs/features/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        ref.read(authenticationProvider.notifier).verifyStatus();
        context.push(signInScreen);
      }
    });
  }

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
