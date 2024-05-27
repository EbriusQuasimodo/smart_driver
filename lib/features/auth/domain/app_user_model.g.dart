// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      orgId: (json['org_id'] as num?)?.toInt() ?? 0,
      token: json['token'] as String? ?? '',
      refresh: json['refresh'] as String? ?? '',
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'org_id': instance.orgId,
      'token': instance.token,
      'refresh': instance.refresh,
      'role': instance.role,
    };
