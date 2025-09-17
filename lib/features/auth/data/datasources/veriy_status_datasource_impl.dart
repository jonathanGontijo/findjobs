import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/infraestructure/mappers/mappers.dart';
import 'package:findjobs/features/auth/infraestructure/user_response/user_response_api.dart';
import 'package:findjobs/features/shared/infrastruture/cache/secure_storage_adapter.dart';

import '../../../../core/core.dart' show HttpClient;
import '../../../../core/failure.dart';
import '../../domain/datasource/datasources.dart';
import '../../domain/entities/entities.dart';

class VerifyStatusDatasourceImpl implements VerifyStatusDatasource {
  final HttpClient _httpClient;
  SecureStorageAdapter _secureStorageAdapter;

  VerifyStatusDatasourceImpl({
    required HttpClient httpClient,
    required SecureStorageAdapter secureStorageAdapter,
  }) : _httpClient = httpClient,
       _secureStorageAdapter = secureStorageAdapter;

  @override
  Future<Either<Failure, UserEntity>> verify() async {
      
     final token=    await _secureStorageAdapter.fetch("token");
    return _httpClient.get(
      url: "auth/check-status",
      headers: {"Authorization": "Bearer $token"},
      fromJson: (json)  {
        final result = UserResponseAPi.fromJson(json).data;
        return UserMapper().userModelToEntity(result.user);
      },
    );
  }
}

