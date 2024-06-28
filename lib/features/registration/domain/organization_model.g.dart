// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      organizationBranches: (json['organization_branches'] as List<dynamic>?)
          ?.map((e) => OrganizationBranches.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'name': instance.name,
      'description': instance.description,
      'organization_branches':
          instance.organizationBranches?.map((e) => e.toJson()).toList(),
    };

_$OrganizationBranchesImpl _$$OrganizationBranchesImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationBranchesImpl(
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      branchSectors: json['branch_sectors'] == null
          ? null
          : BranchSectors.fromJson(
              json['branch_sectors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrganizationBranchesImplToJson(
        _$OrganizationBranchesImpl instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'name': instance.name,
      'branch_sectors': instance.branchSectors?.toJson(),
    };

_$BranchSectorsImpl _$$BranchSectorsImplFromJson(Map<String, dynamic> json) =>
    _$BranchSectorsImpl(
      branchId: (json['branch_id'] as num?)?.toInt() ?? 0,
      coordinates: (json['coordinates'] as List<dynamic>?)
              ?.map((e) => Coordinates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BranchSectorsImplToJson(_$BranchSectorsImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'coordinates': instance.coordinates.map((e) => e.toJson()).toList(),
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      lat: json['lat'] as String? ?? '',
      long: json['long'] as String? ?? '',
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
