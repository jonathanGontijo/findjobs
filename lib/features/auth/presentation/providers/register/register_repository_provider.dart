import 'package:findjobs/features/auth/domain/repositories/register_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasources/register_datasource_impl.dart';
import '../../../data/repositories/register_repository_impl.dart';
import '../http_client_provider.dart';

part 'register_repository_provider.g.dart';

@riverpod
RegisterRepository registerRepository(Ref ref) {
  return RegisterRepositoryImpl(
    (RegisterDatasourceImpl(ref.read(httpClientProvider))),
  );
}
