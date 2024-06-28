import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_driver/features/auth/data/fake_auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class LoginScreenController extends _$LoginScreenController {
  @override
  FutureOr<void> build() {
    // no-oppp
  }

  Future<void> signInAnonymously(String login, String password, String uid) async {
    state = const AsyncLoading();
    final authRepository = ref.read(fakeAuthRepositoryProvider);
    state = await AsyncValue.guard(() {return authRepository.logIn(login, password, uid);});
  }
}