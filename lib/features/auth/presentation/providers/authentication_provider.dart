import 'dart:developer';

import 'package:findjobs/core/failure.dart';
import 'package:findjobs/features/auth/domain/entities/entities.dart';
import 'package:findjobs/features/auth/domain/usecases/login_usecase.dart';
import 'package:findjobs/features/auth/presentation/providers/login_repository_proivder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/helpers/helpers.dart';

part 'authentication_provider.g.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthenticationState {
  bool isLoading;
  UserEntity? userEntity;
  Failure? failure;
  AuthStatus authStatus;

  AuthenticationState({
    this.isLoading = false,
    this.userEntity,
    this.failure,
    this.authStatus = AuthStatus.checking,
  });
}

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  FutureOr<AuthenticationState> build() => AuthenticationState();

  Future<void> login(AuthenticationParams params) async {
    final loginUsecase = LoginUsecase(ref.read(loginRepositoryProvider));

    final result = await loginUsecase(params);

    result.fold(
      (failure) => log('falha ao logar: ${failure.message}'),
      (user) => log('Logado com sucesso: ${user.name}'),
    );
  }
}
