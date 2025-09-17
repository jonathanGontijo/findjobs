import 'package:dartz/dartz.dart';
import 'package:findjobs/core/core.dart';

import '../entities/entities.dart';

abstract class VerifyStatusRepository {
  Future<Either<Failure, UserEntity>> verify( );
}
