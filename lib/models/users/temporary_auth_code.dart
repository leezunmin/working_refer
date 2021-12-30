library temporary_auth_code;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'temporary_auth_code.g.dart';

abstract class TemporaryAuthCode
    implements Built<TemporaryAuthCode, TemporaryAuthCodeBuilder> {
  TemporaryAuthCode._();

  factory TemporaryAuthCode([Function(TemporaryAuthCodeBuilder b)? updates]) =
      _$TemporaryAuthCode;

  @BuiltValueField(wireName: 'type')
  String get type;
  @BuiltValueField(wireName: 'code')
  String get code;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'createdAt')
  DateTime? get createdAt;

  String toJson() {
    return json
        .encode(serializers.serializeWith(TemporaryAuthCode.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(TemporaryAuthCode.serializer, this)
        as Map<String, dynamic>;
  }

  static TemporaryAuthCode? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TemporaryAuthCode.serializer, json.decode(jsonString));
  }

  static TemporaryAuthCode? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(TemporaryAuthCode.serializer, data);
    return _;
  }

  static Serializer<TemporaryAuthCode> get serializer =>
      _$temporaryAuthCodeSerializer;
}
