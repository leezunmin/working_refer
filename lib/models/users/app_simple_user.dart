library app_simple_user;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_simple_user.g.dart';

abstract class AppSimpleUser
    implements Built<AppSimpleUser, AppSimpleUserBuilder> {
  AppSimpleUser._();

  factory AppSimpleUser([Function(AppSimpleUserBuilder b)? updates]) =
      _$AppSimpleUser;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'date')
  DateTime get date;
  @BuiltValueField(wireName: 'orderingStamp')
  int get orderingStamp;
  @BuiltValueField(wireName: 'type')
  String get type;
  @BuiltValueField(wireName: 'status')
  String? get status;
  @BuiltValueField(wireName: 'likeType')
  int? get likeType;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AppSimpleUser.serializer, this));
  }

  static AppSimpleUser? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppSimpleUser.serializer, json.decode(jsonString));
  }

  static AppSimpleUser? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppSimpleUser.serializer, data);
    return _;
  }

  static Serializer<AppSimpleUser> get serializer => _$appSimpleUserSerializer;
}
