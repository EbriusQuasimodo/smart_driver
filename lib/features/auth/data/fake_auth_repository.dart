import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:smart_driver/core/utils/isar/user_isar_model.dart';
import 'package:smart_driver/features/auth/domain/app_user_model.dart';

class FakeAuthRepository {
  FakeAuthRepository( this.isar);

  //final LoginDataSource authDataSource;
  final Isar? isar;

  Stream<User?> authStateChanges() =>
      isar?.users.watchObject(0, fireImmediately: true) ??
      const Stream.empty();

  User? get currentUser => isar?.users.getSync(0);

  @override
  Future<void> logIn(String login, String password, String uid) async {
    if (currentUser == null && login == 'admin'&&password == 'admin') {
      AppUser appUser = AppUser(
        userId: 1,
        orgId: 1,
        refresh: "e0732792-4bae-11ee-bf32-005056010812",
        token: "bf85080a-4fb2-11ee-814f-005056010812",
        role: "admin",
      );
      User userData = User()
        ..uid = uid
        ..id = appUser.userId
        ..orgId = appUser.orgId
        ..token = appUser.token
        ..refresh = appUser.refresh;
      await isar?.writeTxn(() async => await isar?.users.put(userData));
    }
  }

  @override
  Future<void> logOut() async {
    isar?.users.clear();
  }
}

final fakeAuthRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  //final authDataSource = LoginDataSource(Dio());
  final isar = Isar.getInstance();
  final auth = FakeAuthRepository(
    isar,
  );
  return auth;
});