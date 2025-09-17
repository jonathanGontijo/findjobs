import 'package:dartz/dartz.dart';

import 'package:findjobs/core/failure.dart';

import 'package:findjobs/features/auth/domain/entities/user_entity.dart';


import '../../domain/datasource/datasources.dart';
import '../../domain/repositories/repositories.dart';

class VerifyStatusRepositoryImpl implements VerifyStatusRepository {
  final VerifyStatusDatasource datasource;

  VerifyStatusRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> verify( ) {
    return datasource.verify();
  }
}
