import 'package:dartz/dartz.dart';
import 'package:findjobs/core/core.dart';
import 'package:findjobs/features/auth/domain/helpers/authentication_params.dart';

import '../entities/entities.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> login(AuthenticationParams params);
}
