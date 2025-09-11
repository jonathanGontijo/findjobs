import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/infraestructure/mappers/mappers.dart';
import 'package:findjobs/features/auth/infraestructure/user_response/user_response_api.dart';
import 'package:findjobs/features/shared/infrastruture/cache/secure_storage_adapter.dart';

import '../../../../core/core.dart' show HttpClient;
import '../../../../core/failure.dart';
import '../../domain/datasource/datasources.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
  final HttpClient _httpClient;
  final SecureStorageAdapter _secureStorageAdapter;

  RegisterDatasourceImpl({
    required HttpClient httpClient,
    required SecureStorageAdapter secureStorageAdapter,
  }) : _httpClient = httpClient,
       _secureStorageAdapter = secureStorageAdapter;

  @override
  Future<Either<Failure, UserEntity>> register(RegisterParams params) {
    return _httpClient.post(
      url: "auth/register",
      data: RemoteRegisterParams.fromDomain(params).toJson(),
      fromJson: (json) async {
        final result = UserResponseAPi.fromJson(json).data;
        _secureStorageAdapter.save(key: 'Token', value: result.token);
        return UserMapper().userModelToEntity(result.user);
      },
    );
  }
}

class RemoteRegisterParams {
  String name;
  String phone;
  String email;
  String password;

  RemoteRegisterParams({
    required this.email,
    required this.password,
    this.name = '',
    this.phone = '',
  });

  factory RemoteRegisterParams.fromDomain(RegisterParams params) {
    return RemoteRegisterParams(
      name: params.name,
      email: params.email,
      phone: params.password,
      password: params.password,
    );
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'name': name, 'phone': phone};
  }
}
