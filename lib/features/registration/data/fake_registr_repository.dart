import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:smart_driver/core/utils/isar/user_isar_model.dart';
import 'package:smart_driver/features/auth/domain/app_user_model.dart';

class FakeRegistrRepository {
  FakeRegistrRepository();

  // //final LoginDataSource authDataSource;
  // final Isar? isar;

  // Stream<User?> registrStateChanges() =>
  //     isar?.users.watchObject(0, fireImmediately: true) ??
  //     const Stream.empty();

  // User? get currentOrg => isar?.users.getSync(0);

  @override
  Future<void> registr(String login, String password, String uid) async {
   
  }

 
}

final fakeRegistrRepositoryProvider = Provider<FakeRegistrRepository>((ref) {
  //final authDataSource = LoginDataSource(Dio());
  
  final auth = FakeRegistrRepository(

  );
  return auth;
});