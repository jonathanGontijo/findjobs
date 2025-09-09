import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/domain/entities/user_entity.dart';
import 'package:findjobs/features/auth/domain/helpers/helpers.dart';

import '../../../../core/core.dart';
import '../repositories/repositories.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call(RegisterParams params) {
    return repository.register(params);
  }
}
