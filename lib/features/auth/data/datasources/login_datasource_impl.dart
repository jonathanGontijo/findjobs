import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/datasource/datasources.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<Either<Failure, UserEntity>> login(AuthenticationParams params) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
