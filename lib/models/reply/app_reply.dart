library app_reply;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_reply.g.dart';

abstract class AppReply implements Built<AppReply, AppReplyBuilder> {
  AppReply._();

  factory AppReply([Function(AppReplyBuilder b)? updates]) = _$AppReply;
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
  @BuiltValueField(wireName: 'seq_uid')
  int? get seqUid;
  @BuiltValueField(wireName: 'postUid')
  String? get postUid;
  @BuiltValueField(wireName: 'replyUid')
  String? get replyUid;

  @BuiltValueField(wireName: 'createDate')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'content')
  String? get content;
  @BuiltValueField(wireName: 'profile')
  String? get profile;

  @BuiltValueField(wireName: 'rereplyUid')
  String? get rereplyUid;
  @BuiltValueField(wireName: 'rere_content')
  String? get rere_content;
  @BuiltValueField(wireName: 'tagUser')
  String? get tagUser;

  @BuiltValueField(wireName: 'imgDownload')
  String? get imgDownload;
  @BuiltValueField(wireName: 'deleteImgPath')
  String? get deleteImgPath;

  /*@override
  AppChatRoom rebuild(void Function(AppChatRoomBuilder) updates) =>
      (toBuilder()..update(updates)).build();*/

  String toJson() {
    return json.encode(serializers.serializeWith(AppReply.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppReply.serializer, this)
    as Map<dynamic, dynamic>;
  }

  static AppReply? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppReply.serializer, data);
    return _;
  }

  static AppReply? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppReply.serializer, json.decode(jsonString));
  }

  static Serializer<AppReply> get serializer => _$appReplySerializer;

  static AppReply makeReply({
    String? ownerId,
    String? postUid,
    String? replyUid,
    String? content,
    String? nickName,
    /* AppMessageTypeEnum type,
        AppPostHeaderEnum header,
        AppVote vote*/
    String? tagUser,
    String? collectionType
    // , DateTime createDate
    ,
    String? deleteFlag,
    String? imgDownload,
    String? deleteImgPath,
  }) {
    AppReply reply = AppReply.fromMap({
      "ownerId": ownerId,
      "nickName": nickName,
      "postUid": postUid,
      "replyUid": replyUid,
      "content": content,
      "tagUser": tagUser,
      "collectionType": collectionType,
      "deleteFlag": "N",
      "imgDownload": imgDownload,
      "deleteImgPath": deleteImgPath
    })!
        .rebuild((b) => b..createDate = DateTime.now());

    // post = post.rebuild((b) => b.vote = vote.toBuilder());
    // post = post.rebuild((b) => b.replyOrigin = b.replyOrigin.toBuilder());

    return reply;
  }
}
