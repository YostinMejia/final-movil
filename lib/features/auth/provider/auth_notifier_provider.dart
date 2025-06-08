import 'dart:async';

import 'package:chiva_exp/features/auth/infrastructure/auth_repository.dart';
import 'package:chiva_exp/features/auth/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = AsyncNotifierProvider<AsyncAuthNotifier, void>(() {
  return AsyncAuthNotifier();
});

class AsyncAuthNotifier extends AsyncNotifier {
  late final AuthRepository _authRepository;

  @override
  FutureOr build() async {
    _authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(
      () => _authRepository.createUserWithEmailAndPassword(email, password),
    );
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _authRepository.login(email, password),
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_authRepository.logout);
  }
}
