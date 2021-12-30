library app_user_location;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'app_user_location.g.dart';

abstract class AppUserLocation
    implements Built<AppUserLocation, AppUserLocationBuilder> {
  AppUserLocation._();

  factory AppUserLocation([Function(AppUserLocationBuilder b)? updates]) =
      _$AppUserLocation;

  @BuiltValueField(wireName: 'geohash')
  String? get geohash;
  @BuiltValueField(wireName: 'userId')
  String get userId;
  @BuiltValueField(wireName: 'lat')
  double? get lat;
  @BuiltValueField(wireName: 'lng')
  double? get lng;
  @BuiltValueField(wireName: 'point')
  GeoPoint? get point;

  // @BuiltValueField(wireName: 'maxDistance')
  // int get maxDistance;
  // @BuiltValueField(wireName: 'maxAge')
  // int get maxAge;
  // @BuiltValueField(wireName: 'minAge')
  // int get minAge;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AppUserLocation.serializer, this));
  }

  static AppUserLocation? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppUserLocation.serializer, json.decode(jsonString));
  }

  static Serializer<AppUserLocation> get serializer =>
      _$appUserLocationSerializer;
}
