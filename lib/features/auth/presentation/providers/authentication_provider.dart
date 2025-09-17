import 'package:findjobs/configs/router/app_router.dart';
import 'package:findjobs/core/failure.dart';
import 'package:findjobs/features/auth/domain/entities/entities.dart';
import 'package:findjobs/features/auth/domain/usecases/verify_status_usacase.dart';
import 'package:findjobs/features/auth/presentation/providers/auth_status/verify_status_repository.dart';
import 'package:findjobs/features/auth/presentation/providers/login/login_repository_proivder.dart';
import 'package:findjobs/features/auth/presentation/providers/register/register_repository_provider.dart';
import 'package:findjobs/features/auth/presentation/ui/helpers/messages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecase.dart';

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

  AuthenticationState copyWith({
    bool? isLoading,
    UserEntity? userEntity,
    Failure? failure,
    AuthStatus? authStatus,
  }) {
    return AuthenticationState(
      isLoading: isLoading ?? this.isLoading,
      userEntity: userEntity ?? this.userEntity,
      failure: failure ?? this.failure,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  FutureOr<AuthenticationState> build() => AuthenticationState();

  Future<void> login(AuthenticationParams params) async {
    state = AsyncData(state.value!.copyWith(isLoading: true));
    final loginUsecase = LoginUsecase(ref.read(loginRepositoryProvider));

    final result = await loginUsecase(params);

    result.fold(
      (failure) {
        MessagesService.showCustomSnackBar(failure.message, error: true);
        _setAuthStatusWhenError(failure);
      },
      (user) {
        _setAuthStatusWhenSucess(user);
        ref.read(appRouterProvider).go(homeScreen);
      },
    );

    state = AsyncData(state.value!.copyWith(isLoading: false));
  }

  Future<void> register(RegisterParams params) async {
    state = AsyncData(state.value!.copyWith(isLoading: true));
    final registerUsecase = RegisterUsecase(
      ref.read(registerRepositoryProvider),
    );

    final result = await registerUsecase(params);

    result.fold(
      (failure) {
        MessagesService.showCustomSnackBar(failure.message, error: true);
        _setAuthStatusWhenError(failure);
      },

      (user) {
        _setAuthStatusWhenSucess(user);
        ref.read(appRouterProvider).go(homeScreen);
      },
    );

    state = AsyncData(state.value!.copyWith(isLoading: false));
  }

  Future<void> verifyStatus() async {
    state = AsyncData(
      state.value!.copyWith(isLoading: true, authStatus: AuthStatus.checking),
    );
    final verifyStatusUsecase = VerifyStatusUsacase(
      ref.read(verifyStatusRepositoryProvider),
    );

    final result = await verifyStatusUsecase();

    result.fold(
      (failure) {
        MessagesService.showCustomSnackBar(failure.message, error: true);
        _setAuthStatusWhenError(failure);
        ref.read(appRouterProvider).go(introScreen);
      },

      (user) {
        _setAuthStatusWhenSucess(user);
        ref.read(appRouterProvider).go(homeScreen);
      },
    );

    state = AsyncData(state.value!.copyWith(isLoading: false));
  }

  void _setAuthStatusWhenSucess(UserEntity user) {
    state = AsyncData(
      state.value!.copyWith(
        isLoading: false,
        authStatus: AuthStatus.authenticated,
        userEntity: user,
      ),
    );
  }

  void _setAuthStatusWhenError(Failure? failure) {
    state = AsyncData(
      state.value!.copyWith(
        isLoading: false,
        authStatus: AuthStatus.notAuthenticated,
        userEntity: null,
        failure: failure,
      ),
    );
  }
}
