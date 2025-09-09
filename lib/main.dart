import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:findjobs/configs/configs.dart';
import 'package:findjobs/features/auth/data/datasources/login_datasource_impl.dart';
import 'package:findjobs/features/auth/data/repositories/login_repository_impl.dart';
import 'package:findjobs/features/auth/domain/usecases/login_usecase.dart';
import 'package:findjobs/features/shared/infrastruture/http_client_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/domain/helpers/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));

  await Environment.initEnvironment();

  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  final httpClient = HttpClientImpl(dio);
  final remoteDatasource = LoginDatasourceImpl(httpClient);
  final repository = LoginRepositoryImpl(remoteDatasource);
  final usecase = LoginUsecase(repository);

  final result = await usecase(
    AuthenticationParams(
      email: "eliezer.user@gmail.com",
      secret: "eliezerF123",
    ),
  );

  result.fold(
    (failure) => log('falha ao logar: ${failure.message}'),
    (user) => log('Logado com sucesso: ${user.name}'),
  );
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
