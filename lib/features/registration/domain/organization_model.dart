/// Simple class representing the user UID and login.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.g.dart';
part 'organization_model.freezed.dart';


@freezed
class Organization with _$Organization {
  @JsonSerializable(explicitToJson: true)
  factory Organization({
    @JsonKey(name: 'organization_id') @Default(0) int organizationId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'organization_branches')List<OrganizationBranches>? organizationBranches,
  }) = _Organization;

  factory Organization.fromJson(Map<String, Object?> json) =>
      _$OrganizationFromJson(json);
}

@freezed
class OrganizationBranches with _$OrganizationBranches {
  @JsonSerializable(explicitToJson: true)
  factory OrganizationBranches({
    @JsonKey(name: 'organization_id') @Default(0) int organizationId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'branch_sectors') BranchSectors? branchSectors,
  }) = _OrganizationBranches;

  factory OrganizationBranches.fromJson(Map<String, Object?> json) =>
      _$OrganizationBranchesFromJson(json);
}

@freezed
class BranchSectors with _$BranchSectors {
  @JsonSerializable(explicitToJson: true)
  factory BranchSectors({
    @JsonKey(name: 'branch_id') @Default(0) int organizationId,
    @JsonKey(name: 'coordinates') @Default([]) List<Coordinates> coordinates,
  }) = _BranchSectors;

  factory BranchSectors.fromJson(Map<String, Object?> json) =>
      _$BranchSectorsFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
  @JsonSerializable(explicitToJson: true)
  factory Coordinates({
    @JsonKey(name: 'lat') @Default('') String lat,
    @JsonKey(name: 'long') @Default('') String long,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, Object?> json) =>
      _$CoordinatesFromJson(json);
}