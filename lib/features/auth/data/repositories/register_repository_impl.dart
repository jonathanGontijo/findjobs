import 'package:dartz/dartz.dart';

import 'package:findjobs/core/failure.dart';

import 'package:findjobs/features/auth/domain/entities/user_entity.dart';

import 'package:findjobs/features/auth/domain/helpers/helpers.dart';

import '../../domain/datasource/datasources.dart';
import '../../domain/repositories/repositories.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDatasource datasource;

  RegisterRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> register(RegisterParams params) {
    return datasource.register(params);
  }
}
