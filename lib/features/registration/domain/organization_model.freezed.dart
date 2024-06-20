// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

/// @nodoc
mixin _$Organization {
  @JsonKey(name: 'organization_id')
  int get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_branches')
  List<OrganizationBranches>? get organizationBranches =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res, Organization>;
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') int organizationId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'organization_branches')
      List<OrganizationBranches>? organizationBranches});
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res, $Val extends Organization>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? name = null,
    Object? description = null,
    Object? organizationBranches = freezed,
  }) {
    return _then(_value.copyWith(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      organizationBranches: freezed == organizationBranches
          ? _value.organizationBranches
          : organizationBranches // ignore: cast_nullable_to_non_nullable
              as List<OrganizationBranches>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizationImplCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$$OrganizationImplCopyWith(
          _$OrganizationImpl value, $Res Function(_$OrganizationImpl) then) =
      __$$OrganizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') int organizationId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'organization_branches')
      List<OrganizationBranches>? organizationBranches});
}

/// @nodoc
class __$$OrganizationImplCopyWithImpl<$Res>
    extends _$OrganizationCopyWithImpl<$Res, _$OrganizationImpl>
    implements _$$OrganizationImplCopyWith<$Res> {
  __$$OrganizationImplCopyWithImpl(
      _$OrganizationImpl _value, $Res Function(_$OrganizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? name = null,
    Object? description = null,
    Object? organizationBranches = freezed,
  }) {
    return _then(_$OrganizationImpl(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      organizationBranches: freezed == organizationBranches
          ? _value._organizationBranches
          : organizationBranches // ignore: cast_nullable_to_non_nullable
              as List<OrganizationBranches>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrganizationImpl implements _Organization {
  _$OrganizationImpl(
      {@JsonKey(name: 'organization_id') this.organizationId = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'organization_branches')
      final List<OrganizationBranches>? organizationBranches})
      : _organizationBranches = organizationBranches;

  factory _$OrganizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationImplFromJson(json);

  @override
  @JsonKey(name: 'organization_id')
  final int organizationId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String description;
  final List<OrganizationBranches>? _organizationBranches;
  @override
  @JsonKey(name: 'organization_branches')
  List<OrganizationBranches>? get organizationBranches {
    final value = _organizationBranches;
    if (value == null) return null;
    if (_organizationBranches is EqualUnmodifiableListView)
      return _organizationBranches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Organization(organizationId: $organizationId, name: $name, description: $description, organizationBranches: $organizationBranches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationImpl &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._organizationBranches, _organizationBranches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, organizationId, name,
      description, const DeepCollectionEquality().hash(_organizationBranches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      __$$OrganizationImplCopyWithImpl<_$OrganizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationImplToJson(
      this,
    );
  }
}

abstract class _Organization implements Organization {
  factory _Organization(
          {@JsonKey(name: 'organization_id') final int organizationId,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'description') final String description,
          @JsonKey(name: 'organization_branches')
          final List<OrganizationBranches>? organizationBranches}) =
      _$OrganizationImpl;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$OrganizationImpl.fromJson;

  @override
  @JsonKey(name: 'organization_id')
  int get organizationId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'organization_branches')
  List<OrganizationBranches>? get organizationBranches;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrganizationBranches _$OrganizationBranchesFromJson(Map<String, dynamic> json) {
  return _OrganizationBranches.fromJson(json);
}

/// @nodoc
mixin _$OrganizationBranches {
  @JsonKey(name: 'organization_id')
  int get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_sectors')
  BranchSectors? get branchSectors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationBranchesCopyWith<OrganizationBranches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationBranchesCopyWith<$Res> {
  factory $OrganizationBranchesCopyWith(OrganizationBranches value,
          $Res Function(OrganizationBranches) then) =
      _$OrganizationBranchesCopyWithImpl<$Res, OrganizationBranches>;
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') int organizationId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'branch_sectors') BranchSectors? branchSectors});

  $BranchSectorsCopyWith<$Res>? get branchSectors;
}

/// @nodoc
class _$OrganizationBranchesCopyWithImpl<$Res,
        $Val extends OrganizationBranches>
    implements $OrganizationBranchesCopyWith<$Res> {
  _$OrganizationBranchesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? name = null,
    Object? branchSectors = freezed,
  }) {
    return _then(_value.copyWith(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      branchSectors: freezed == branchSectors
          ? _value.branchSectors
          : branchSectors // ignore: cast_nullable_to_non_nullable
              as BranchSectors?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchSectorsCopyWith<$Res>? get branchSectors {
    if (_value.branchSectors == null) {
      return null;
    }

    return $BranchSectorsCopyWith<$Res>(_value.branchSectors!, (value) {
      return _then(_value.copyWith(branchSectors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrganizationBranchesImplCopyWith<$Res>
    implements $OrganizationBranchesCopyWith<$Res> {
  factory _$$OrganizationBranchesImplCopyWith(_$OrganizationBranchesImpl value,
          $Res Function(_$OrganizationBranchesImpl) then) =
      __$$OrganizationBranchesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'organization_id') int organizationId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'branch_sectors') BranchSectors? branchSectors});

  @override
  $BranchSectorsCopyWith<$Res>? get branchSectors;
}

/// @nodoc
class __$$OrganizationBranchesImplCopyWithImpl<$Res>
    extends _$OrganizationBranchesCopyWithImpl<$Res, _$OrganizationBranchesImpl>
    implements _$$OrganizationBranchesImplCopyWith<$Res> {
  __$$OrganizationBranchesImplCopyWithImpl(_$OrganizationBranchesImpl _value,
      $Res Function(_$OrganizationBranchesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? name = null,
    Object? branchSectors = freezed,
  }) {
    return _then(_$OrganizationBranchesImpl(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      branchSectors: freezed == branchSectors
          ? _value.branchSectors
          : branchSectors // ignore: cast_nullable_to_non_nullable
              as BranchSectors?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrganizationBranchesImpl implements _OrganizationBranches {
  _$OrganizationBranchesImpl(
      {@JsonKey(name: 'organization_id') this.organizationId = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'branch_sectors') this.branchSectors});

  factory _$OrganizationBranchesImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationBranchesImplFromJson(json);

  @override
  @JsonKey(name: 'organization_id')
  final int organizationId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'branch_sectors')
  final BranchSectors? branchSectors;

  @override
  String toString() {
    return 'OrganizationBranches(organizationId: $organizationId, name: $name, branchSectors: $branchSectors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationBranchesImpl &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.branchSectors, branchSectors) ||
                other.branchSectors == branchSectors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, organizationId, name, branchSectors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationBranchesImplCopyWith<_$OrganizationBranchesImpl>
      get copyWith =>
          __$$OrganizationBranchesImplCopyWithImpl<_$OrganizationBranchesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationBranchesImplToJson(
      this,
    );
  }
}

abstract class _OrganizationBranches implements OrganizationBranches {
  factory _OrganizationBranches(
      {@JsonKey(name: 'organization_id') final int organizationId,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'branch_sectors')
      final BranchSectors? branchSectors}) = _$OrganizationBranchesImpl;

  factory _OrganizationBranches.fromJson(Map<String, dynamic> json) =
      _$OrganizationBranchesImpl.fromJson;

  @override
  @JsonKey(name: 'organization_id')
  int get organizationId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'branch_sectors')
  BranchSectors? get branchSectors;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationBranchesImplCopyWith<_$OrganizationBranchesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BranchSectors _$BranchSectorsFromJson(Map<String, dynamic> json) {
  return _BranchSectors.fromJson(json);
}

/// @nodoc
mixin _$BranchSectors {
  @JsonKey(name: 'branch_id')
  int get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coordinates')
  List<Coordinates> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchSectorsCopyWith<BranchSectors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchSectorsCopyWith<$Res> {
  factory $BranchSectorsCopyWith(
          BranchSectors value, $Res Function(BranchSectors) then) =
      _$BranchSectorsCopyWithImpl<$Res, BranchSectors>;
  @useResult
  $Res call(
      {@JsonKey(name: 'branch_id') int organizationId,
      @JsonKey(name: 'coordinates') List<Coordinates> coordinates});
}

/// @nodoc
class _$BranchSectorsCopyWithImpl<$Res, $Val extends BranchSectors>
    implements $BranchSectorsCopyWith<$Res> {
  _$BranchSectorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchSectorsImplCopyWith<$Res>
    implements $BranchSectorsCopyWith<$Res> {
  factory _$$BranchSectorsImplCopyWith(
          _$BranchSectorsImpl value, $Res Function(_$BranchSectorsImpl) then) =
      __$$BranchSectorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'branch_id') int organizationId,
      @JsonKey(name: 'coordinates') List<Coordinates> coordinates});
}

/// @nodoc
class __$$BranchSectorsImplCopyWithImpl<$Res>
    extends _$BranchSectorsCopyWithImpl<$Res, _$BranchSectorsImpl>
    implements _$$BranchSectorsImplCopyWith<$Res> {
  __$$BranchSectorsImplCopyWithImpl(
      _$BranchSectorsImpl _value, $Res Function(_$BranchSectorsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? coordinates = null,
  }) {
    return _then(_$BranchSectorsImpl(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BranchSectorsImpl implements _BranchSectors {
  _$BranchSectorsImpl(
      {@JsonKey(name: 'branch_id') this.organizationId = 0,
      @JsonKey(name: 'coordinates')
      final List<Coordinates> coordinates = const []})
      : _coordinates = coordinates;

  factory _$BranchSectorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchSectorsImplFromJson(json);

  @override
  @JsonKey(name: 'branch_id')
  final int organizationId;
  final List<Coordinates> _coordinates;
  @override
  @JsonKey(name: 'coordinates')
  List<Coordinates> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'BranchSectors(organizationId: $organizationId, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchSectorsImpl &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, organizationId,
      const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchSectorsImplCopyWith<_$BranchSectorsImpl> get copyWith =>
      __$$BranchSectorsImplCopyWithImpl<_$BranchSectorsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchSectorsImplToJson(
      this,
    );
  }
}

abstract class _BranchSectors implements BranchSectors {
  factory _BranchSectors(
          {@JsonKey(name: 'branch_id') final int organizationId,
          @JsonKey(name: 'coordinates') final List<Coordinates> coordinates}) =
      _$BranchSectorsImpl;

  factory _BranchSectors.fromJson(Map<String, dynamic> json) =
      _$BranchSectorsImpl.fromJson;

  @override
  @JsonKey(name: 'branch_id')
  int get organizationId;
  @override
  @JsonKey(name: 'coordinates')
  List<Coordinates> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$BranchSectorsImplCopyWith<_$BranchSectorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return _Coordinates.fromJson(json);
}

/// @nodoc
mixin _$Coordinates {
  @JsonKey(name: 'lat')
  String get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'long')
  String get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinatesCopyWith<Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesCopyWith<$Res> {
  factory $CoordinatesCopyWith(
          Coordinates value, $Res Function(Coordinates) then) =
      _$CoordinatesCopyWithImpl<$Res, Coordinates>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') String lat, @JsonKey(name: 'long') String long});
}

/// @nodoc
class _$CoordinatesCopyWithImpl<$Res, $Val extends Coordinates>
    implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinatesImplCopyWith<$Res>
    implements $CoordinatesCopyWith<$Res> {
  factory _$$CoordinatesImplCopyWith(
          _$CoordinatesImpl value, $Res Function(_$CoordinatesImpl) then) =
      __$$CoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') String lat, @JsonKey(name: 'long') String long});
}

/// @nodoc
class __$$CoordinatesImplCopyWithImpl<$Res>
    extends _$CoordinatesCopyWithImpl<$Res, _$CoordinatesImpl>
    implements _$$CoordinatesImplCopyWith<$Res> {
  __$$CoordinatesImplCopyWithImpl(
      _$CoordinatesImpl _value, $Res Function(_$CoordinatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$CoordinatesImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CoordinatesImpl implements _Coordinates {
  _$CoordinatesImpl(
      {@JsonKey(name: 'lat') this.lat = '',
      @JsonKey(name: 'long') this.long = ''});

  factory _$CoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatesImplFromJson(json);

  @override
  @JsonKey(name: 'lat')
  final String lat;
  @override
  @JsonKey(name: 'long')
  final String long;

  @override
  String toString() {
    return 'Coordinates(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      __$$CoordinatesImplCopyWithImpl<_$CoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatesImplToJson(
      this,
    );
  }
}

abstract class _Coordinates implements Coordinates {
  factory _Coordinates(
      {@JsonKey(name: 'lat') final String lat,
      @JsonKey(name: 'long') final String long}) = _$CoordinatesImpl;

  factory _Coordinates.fromJson(Map<String, dynamic> json) =
      _$CoordinatesImpl.fromJson;

  @override
  @JsonKey(name: 'lat')
  String get lat;
  @override
  @JsonKey(name: 'long')
  String get long;
  @override
  @JsonKey(ignore: true)
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
