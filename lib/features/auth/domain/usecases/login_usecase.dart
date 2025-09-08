import 'package:dartz/dartz.dart';
import 'package:findjobs/features/auth/domain/entities/user_entity.dart';
import 'package:findjobs/features/auth/domain/helpers/helpers.dart';
import 'package:findjobs/features/auth/domain/repositories/login_repository.dart';

import '../../../../core/core.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call(AuthenticationParams params) {
    return repository.login(params);
  }
}
