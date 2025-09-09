import 'package:dartz/dartz.dart';
import 'package:findjobs/core/core.dart';
import 'package:findjobs/features/auth/domain/helpers/helpers.dart';

import '../entities/entities.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserEntity>> register(RegisterParams params);
}
