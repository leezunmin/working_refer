library app_post;

import 'dart:convert';

import 'package:application/models/models.dart';
import 'package:application/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_post.g.dart';

abstract class AppPost implements Built<AppPost, AppPostBuilder> {
  AppPost._();

  factory AppPost([Function(AppPostBuilder b)? updates]) = _$AppPost;

  //추가
  @BuiltValueField(wireName: 'voteUid')
  String? get voteUid;

  @BuiltValueField(wireName: 'postUid')
  String? get postUid;
  @BuiltValueField(wireName: 'deleteFlag')
  String? get deleteFlag;

  @BuiltValueField(wireName: 'imgDownload')
  String? get imgDownload;
  @BuiltValueField(wireName: 'deleteImgPath')
  String? get deleteImgPath;

  @BuiltValueField(wireName: 'collectionType')
  String? get collectionType;

  @BuiltValueField(wireName: 'title')
  String? get title;
  @BuiltValueField(wireName: 'text')
  String get text;
  @BuiltValueField(wireName: 'ownerId')
  String get ownerId;
  @BuiltValueField(wireName: 'nickName')
  String get nickName;
  @BuiltValueField(wireName: 'type')
  AppPostTypeEnum? get type;

  @BuiltValueField(wireName: 'likeCount')
  int? get likeCount;
  @BuiltValueField(wireName: 'replyCount')
  int get replyCount;
  @BuiltValueField(wireName: 'viewCount')
  int? get viewCount;
  @BuiltValueField(wireName: 'totalVoteCount')
  int? get totalVoteCount;

  @BuiltValueField(wireName: 'header')
  AppPostHeaderEnum? get header;
  @BuiltValueField(wireName: 'createdAt')
  DateTime? get createdAt;
  @BuiltValueField(wireName: 'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: 'baseId') //reply data
  String? get baseId;
  @BuiltValueField(wireName: 'parentId') //reply data
  String? get parentId;
  @BuiltValueField(wireName: 'parentType') //reply data
  AppPostTypeEnum? get parentType;

  @BuiltValueField(wireName: 'relpyUsers') //검색용 필드
  BuiltList<String>? get relpyUsers;
  @BuiltValueField(wireName: 'likeUsers') //검색용 필드
  BuiltList<String>? get likeUsers;
  @BuiltValueField(wireName: 'voteUsers') //검색용 필드
  BuiltList<String>? get voteUsers;

  @BuiltValueField(wireName: 'vote')
  AppVote? get vote;

  @BuiltValueField(wireName: 'voteExpire')
  DateTime? get voteExpire;

  static void _initializeBuilder(AppPostBuilder builder) => builder
    ..title = ''
    ..text = ''
    ..ownerId = ''
    ..nickName = ''
    ..imgDownload = ''
    ..deleteImgPath = ''
    ..header = AppPostHeaderEnum.unknown
    ..likeCount = 0
    ..replyCount = 0
    ..viewCount = 0
    ..totalVoteCount = 0
    ..collectionType = 'post'
    ..relpyUsers = ListBuilder<String>()
    ..likeUsers = ListBuilder<String>()
    ..voteUsers = ListBuilder<String>();

  String toJson() {
    return json.encode(serializers.serializeWith(AppPost.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppPost.serializer, this)
        as Map<dynamic, dynamic>;
  }

  static AppPost? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppPost.serializer, json.decode(jsonString));
  }

  static AppPost? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppPost.serializer, data);
    return _;
  }

  static Serializer<AppPost> get serializer => _$appPostSerializer;

  static AppPost makePost(
      {String? title,
      String? text,
      String? ownerId,
      String? nickName,
      AppMessageTypeEnum? type,
      AppPostHeaderEnum? header,
      AppVote? vote,
      String? imgDownload,
      String? deleteImgPath,
      String? collectionType
      //   , List<String>? likeUsers
      ,
      String? deleteFlag}) {
    AppPost post = AppPost.fromMap({
      "type": "post",
      "title": title,
      "text": text,
      "ownerId": ownerId,
      "nickName": nickName,
      "header": header.toString(),
      "imgDownload": imgDownload,
      "deleteImgPath": deleteImgPath,
      "collectionType": "post"
      // , "likeUsers" : ownerId
      ,
      "deleteFlag": "N"
    })!
        .rebuild((b) => b
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now());

    if (vote != null) {
      for (var index = 0; index < vote!.items.length; index++) {
        var item = vote.items[index];
        vote = vote.rebuild((b) {
          b.items.removeAt(index);
          b.items.insert(
              index,
              AppVoteItem.fromMap({
                "text": item!.text,
                // "id": "${index}_${vote.title}_${item.text}"
                // 이부분이 콜렉션 VoteItems 아이디값에 들어감
                "id": "index-$index"
              }));
          return b;
        });
      }
      post = post.rebuild((b) => b.vote = vote!.toBuilder());
    }
    return post;
  }
}
