import 'package:dartz/dartz.dart';
import 'package:findjobs/core/core.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';

abstract class LoginDatasource {
  Future<Either<Failure, UserEntity>> login(AuthenticationParams params);
}
