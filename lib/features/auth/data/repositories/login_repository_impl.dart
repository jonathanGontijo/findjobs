import 'package:dartz/dartz.dart';

import 'package:findjobs/core/failure.dart';

import 'package:findjobs/features/auth/domain/entities/user_entity.dart';

import 'package:findjobs/features/auth/domain/helpers/authentication_params.dart';

import '../../domain/datasource/datasources.dart';
import '../../domain/repositories/repositories.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> login(AuthenticationParams params) {
    return datasource.login(params);
  }
}
