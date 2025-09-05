import 'dart:developer';

import 'package:findjobs/configs/configs.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  await Environment.initEnvironment();

  log(Environment.apiUrl);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'te.',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(true),
      routerConfig: router,
    );
  }
}
