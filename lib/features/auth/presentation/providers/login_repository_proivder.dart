import 'package:findjobs/features/auth/data/datasources/login_datasource_impl.dart';
import 'package:findjobs/features/auth/data/repositories/login_repository_impl.dart';
import 'package:findjobs/features/auth/presentation/providers/http_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/repositories.dart';

part 'login_repository_proivder.g.dart';

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(
    (LoginDatasourceImpl(ref.read(httpClientProvider))),
  );
}
