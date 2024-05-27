// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_id')
  int get orgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh')
  String get refresh => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'org_id') int orgId,
      @JsonKey(name: 'token') String token,
      @JsonKey(name: 'refresh') String refresh,
      @JsonKey(name: 'role') String? role});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? orgId = null,
    Object? token = null,
    Object? refresh = null,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'org_id') int orgId,
      @JsonKey(name: 'token') String token,
      @JsonKey(name: 'refresh') String refresh,
      @JsonKey(name: 'role') String? role});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? orgId = null,
    Object? token = null,
    Object? refresh = null,
    Object? role = freezed,
  }) {
    return _then(_$AppUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl implements _AppUser {
  _$AppUserImpl(
      {@JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'org_id') this.orgId = 0,
      @JsonKey(name: 'token') this.token = '',
      @JsonKey(name: 'refresh') this.refresh = '',
      @JsonKey(name: 'role') this.role});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'org_id')
  final int orgId;
  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'refresh')
  final String refresh;
  @override
  @JsonKey(name: 'role')
  final String? role;

  @override
  String toString() {
    return 'AppUser(userId: $userId, orgId: $orgId, token: $token, refresh: $refresh, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refresh, refresh) || other.refresh == refresh) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, orgId, token, refresh, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {@JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'org_id') final int orgId,
      @JsonKey(name: 'token') final String token,
      @JsonKey(name: 'refresh') final String refresh,
      @JsonKey(name: 'role') final String? role}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'org_id')
  int get orgId;
  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'refresh')
  String get refresh;
  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
