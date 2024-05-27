/// Simple class representing the user UID and login.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.g.dart';
part 'app_user_model.freezed.dart';


@freezed
class AppUser with _$AppUser {
  factory AppUser({
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'org_id') @Default(0) int orgId,
    @JsonKey(name: 'token') @Default('') String token,
    @JsonKey(name: 'refresh') @Default('') String refresh,
    @JsonKey(name: 'role') String? role,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}