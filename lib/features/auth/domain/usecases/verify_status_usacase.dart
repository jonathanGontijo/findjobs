import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/domain/entities/user_entity.dart';
import 'package:findjobs/features/auth/domain/repositories/verify_status_repository.dart';

import '../../../../core/core.dart';

class VerifyStatusUsacase {
  final VerifyStatusRepository repository;

  VerifyStatusUsacase(this.repository);

  Future<Either<Failure, UserEntity>> call( ) {
    return repository.verify();
  }
}
