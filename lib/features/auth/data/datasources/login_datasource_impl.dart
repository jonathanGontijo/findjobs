import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/infraestructure/mappers/mappers.dart';
import 'package:findjobs/features/auth/infraestructure/user_response/user_response_api.dart';
import 'package:findjobs/features/shared/infrastruture/cache/secure_storage_adapter.dart';

import '../../../../core/core.dart' show HttpClient;
import '../../../../core/failure.dart';
import '../../domain/datasource/datasources.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final HttpClient _httpClient;
  SecureStorageAdapter _secureStorageAdapter;

  LoginDatasourceImpl({
    required HttpClient httpClient,
    required SecureStorageAdapter secureStorageAdapter,
  }) : _httpClient = httpClient,
       _secureStorageAdapter = secureStorageAdapter;

  @override
  Future<Either<Failure, UserEntity>> login(AuthenticationParams params) {
    return _httpClient.post(
      url: "auth/login",
      data: RemoteAuthenticationParams.fromDomain(params).toJson(),
      fromJson: (json) async {
        final result = UserResponseAPi.fromJson(json).data;
        await _secureStorageAdapter.save(key: "Token", value: result.token);
        return UserMapper().userModelToEntity(result.user);
      },
    );
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({required this.email, required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) {
    return RemoteAuthenticationParams(
      email: params.email,
      password: params.secret,
    );
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
