library app_user_block;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_user_block.g.dart';

abstract class AppUserBlock
    implements Built<AppUserBlock, AppUserBlockBuilder> {
  AppUserBlock._();

  factory AppUserBlock([Function(AppUserBlockBuilder b)? updates]) =
      _$AppUserBlock;

  @BuiltValueField(wireName: 'userId')
  String get userId;
  @BuiltValueField(wireName: 'faceBookBlocked')
  bool? get faceBookBlocked;
  @BuiltValueField(wireName: 'allBlock')
  BuiltList<String> get allBlock;
  @BuiltValueField(wireName: 'phoneBlock')
  BuiltList<String> get phoneBlock;
  @BuiltValueField(wireName: 'faceBookBlock')
  BuiltList<String> get faceBookBlock;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AppUserBlock.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppUserBlock.serializer, this)
        as Map<dynamic, dynamic>;
  }

  static AppUserBlock? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppUserBlock.serializer, json.decode(jsonString));
  }

  static AppUserBlock? fromMap(Map<dynamic, dynamic>? data) {
    var _ = serializers.deserializeWith(AppUserBlock.serializer, data);
    return _;
  }

  static Serializer<AppUserBlock> get serializer => _$appUserBlockSerializer;
}
