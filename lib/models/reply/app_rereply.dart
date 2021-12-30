library app_re_reply;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_rereply.g.dart';

abstract class AppReReply implements Built<AppReReply, AppReReplyBuilder> {
  AppReReply._();

  factory AppReReply([Function(AppReReplyBuilder b)? updates]) = _$AppReReply;

/*  @BuiltValueField(wireName: 'userId')
  @nullable
  String get userId;*/

  @BuiltValueField(wireName: 'ownerId')
  String? get ownerId;
  @BuiltValueField(wireName: 'deleteFlag')
  String? get deleteFlag;

  @BuiltValueField(wireName: 'collectionType')
  String? get collectionType;

  @BuiltValueField(wireName: 'nickName')
  String? get nickName;

  @BuiltValueField(wireName: 'postUid')
  String? get postUid;

  @BuiltValueField(wireName: 'replyUid')
  String? get replyUid;

  @BuiltValueField(wireName: 'rereplyUid')
  String? get rereplyUid;

  @BuiltValueField(wireName: 'content')
  String? get content;

  @BuiltValueField(wireName: 'tagUser')
  String? get tagUser;

  @BuiltValueField(wireName: 'createDate')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'reCommentTarget')
  String? get reCommentTarget;

  @BuiltValueField(wireName: 'imgDownload')
  String? get imgDownload;
  @BuiltValueField(wireName: 'deleteImgPath')
  String? get deleteImgPath;

  String toJson() {
    return json.encode(serializers.serializeWith(AppReReply.serializer, this));
  }

  static AppReReply? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppReReply.serializer, json.decode(jsonString));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppReReply.serializer, this)
    as Map<dynamic, dynamic>;
  }

  static AppReReply? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppReReply.serializer, data);
    return _;
  }

  static Serializer<AppReReply> get serializer => _$appReReplySerializer;
}
