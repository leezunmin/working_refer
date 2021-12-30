// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_user_location;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppUserLocation> _$appUserLocationSerializer =
    new _$AppUserLocationSerializer();

class _$AppUserLocationSerializer
    implements StructuredSerializer<AppUserLocation> {
  @override
  final Iterable<Type> types = const [AppUserLocation, _$AppUserLocation];
  @override
  final String wireName = 'AppUserLocation';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppUserLocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.geohash;
    if (value != null) {
      result
        ..add('geohash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lng;
    if (value != null) {
      result
        ..add('lng')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.point;
    if (value != null) {
      result
        ..add('point')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GeoPoint)));
    }
    return result;
  }

  @override
  AppUserLocation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppUserLocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'geohash':
          result.geohash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lng':
          result.lng = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'point':
          result.point = serializers.deserialize(value,
              specifiedType: const FullType(GeoPoint)) as GeoPoint?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppUserLocation extends AppUserLocation {
  @override
  final String? geohash;
  @override
  final String userId;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final GeoPoint? point;

  factory _$AppUserLocation([void Function(AppUserLocationBuilder)? updates]) =>
      (new AppUserLocationBuilder()..update(updates)).build();

  _$AppUserLocation._(
      {this.geohash, required this.userId, this.lat, this.lng, this.point})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'AppUserLocation', 'userId');
  }

  @override
  AppUserLocation rebuild(void Function(AppUserLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserLocationBuilder toBuilder() =>
      new AppUserLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppUserLocation &&
        geohash == other.geohash &&
        userId == other.userId &&
        lat == other.lat &&
        lng == other.lng &&
        point == other.point;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, geohash.hashCode), userId.hashCode), lat.hashCode),
            lng.hashCode),
        point.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUserLocation')
          ..add('geohash', geohash)
          ..add('userId', userId)
          ..add('lat', lat)
          ..add('lng', lng)
          ..add('point', point))
        .toString();
  }
}

class AppUserLocationBuilder
    implements Builder<AppUserLocation, AppUserLocationBuilder> {
  _$AppUserLocation? _$v;

  String? _geohash;
  String? get geohash => _$this._geohash;
  set geohash(String? geohash) => _$this._geohash = geohash;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  GeoPoint? _point;
  GeoPoint? get point => _$this._point;
  set point(GeoPoint? point) => _$this._point = point;

  AppUserLocationBuilder();

  AppUserLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _geohash = $v.geohash;
      _userId = $v.userId;
      _lat = $v.lat;
      _lng = $v.lng;
      _point = $v.point;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUserLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppUserLocation;
  }

  @override
  void update(void Function(AppUserLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUserLocation build() {
    final _$result = _$v ??
        new _$AppUserLocation._(
            geohash: geohash,
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'AppUserLocation', 'userId'),
            lat: lat,
            lng: lng,
            point: point);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
