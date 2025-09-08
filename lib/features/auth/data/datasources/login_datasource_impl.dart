import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/infraestructure/mappers/mappers.dart';
import 'package:findjobs/features/auth/infraestructure/user_response/user_response_api.dart';

import '../../../../core/core.dart' show HttpClient;
import '../../../../core/failure.dart';
import '../../domain/datasource/datasources.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final HttpClient _httpClient;

  LoginDatasourceImpl(this._httpClient);
  @override
  Future<Either<Failure, UserEntity>> login(AuthenticationParams params) {
    return _httpClient.post(
      url: "auth/login",
      data: RemoteAuthenticationParams.fromDomain(params).toJson(),
      fromJson:
          (json) => UserMapper().userModelToEntity(
            UserResponseAPi.fromJson(json).data.user,
          ),
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
