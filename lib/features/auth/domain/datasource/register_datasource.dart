import 'package:dartz/dartz.dart';
import 'package:findjobs/core/core.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';

abstract class RegisterDatasource {
  Future<Either<Failure, UserEntity>> register(RegisterParams params);
}
