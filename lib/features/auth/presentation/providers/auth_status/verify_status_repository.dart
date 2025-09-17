

import 'package:findjobs/features/auth/domain/repositories/verify_status_repository.dart';
import 'package:findjobs/features/auth/presentation/factories/cache/secure_storage_adapter_factory.dart';
import 'package:findjobs/features/auth/presentation/providers/http_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasources/veriy_status_datasource_impl.dart';
import '../../../data/repositories/repositories.dart';

part 'verify_status_repository.g.dart';

@riverpod
VerifyStatusRepository verifyStatusRepository(Ref ref) {
  return VerifyStatusRepositoryImpl(
    VerifyStatusDatasourceImpl(
       httpClient: ref.read(httpClientProvider),
      secureStorageAdapter: makeSecureStorageAdapter(),
    )
  );
}
