library insta_auth;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'insta_auth.g.dart';

abstract class InstaAuth implements Built<InstaAuth, InstaAuthBuilder> {
  InstaAuth._();

  factory InstaAuth([Function(InstaAuthBuilder b) updates]) = _$InstaAuth;

  @BuiltValueField(wireName: 'userId')
  num? get userId;
  @BuiltValueField(wireName: 'accessToken')
  String? get accessToken;
  @BuiltValueField(wireName: 'userName')
  String? get userName;
  @BuiltValueField(wireName: 'userFullName')
  String? get userFullName;
  @BuiltValueField(wireName: 'profilePicture')
  String? get profilePicture;

  String toJson() {
    return json.encode(serializers.serializeWith(InstaAuth.serializer, this));
  }

  static InstaAuth? fromMap(Map<dynamic, dynamic>? data) {
    var _ = serializers.deserializeWith(InstaAuth.serializer, data);
    return _;
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(InstaAuth.serializer, this)
        as Map<String, dynamic>;
  }

  static InstaAuth? fromJson(String jsonString) {
    return serializers.deserializeWith(
        InstaAuth.serializer, json.decode(jsonString));
  }

  static Serializer<InstaAuth> get serializer => _$instaAuthSerializer;
}
