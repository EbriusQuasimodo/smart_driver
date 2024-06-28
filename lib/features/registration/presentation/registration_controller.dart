import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_driver/features/registration/data/fake_registr_repository.dart';
import 'package:smart_driver/features/registration/data/org_info_model.dart';
import 'package:smart_driver/features/registration/domain/organization_model.dart';

part 'registration_controller.g.dart';

@riverpod
class LoginScreenController extends _$LoginScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> signInAnonymously(String login, String password, String uid) async {
    state = const AsyncLoading();
    final registrRepository = ref.read(fakeRegistrRepositoryProvider);
    state = await AsyncValue.guard(() {return registrRepository.registr(login, password, uid);});
  }
}

final orgInfoStateProvider = StateProvider<OrgInfoModel>((ref) {
  return OrgInfoModel();
});

final currentBranchPageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final branchesCountStateProvider = StateProvider<int>((ref) {
  return 0;
});
final employeesCountStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final organizationNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});