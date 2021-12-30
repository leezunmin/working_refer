library app_vote_item;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_vote_item.g.dart';

abstract class AppVoteItem implements Built<AppVoteItem, AppVoteItemBuilder> {
  AppVoteItem._();

  factory AppVoteItem([Function(AppVoteItemBuilder b)? updates]) =
      _$AppVoteItem;

  @BuiltValueField(wireName: 'text')
  String? get text;
  @BuiltValueField(wireName: 'id')
  String? get id;

  //추가
  //추가
  @BuiltValueField(wireName: 'count')
  int? get count;
  @BuiltValueField(wireName: 'itemUid')
  String? get itemUid;

  @BuiltValueField(wireName: 'voteUserArray')
  BuiltList<String> get voteUserArray;

  @BuiltValueField(wireName: 'percent')
  double? get percent;

  String toJson() {
    return json.encode(serializers.serializeWith(AppVoteItem.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppVoteItem.serializer, this)
        as Map<dynamic, dynamic>;
  }

  static AppVoteItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppVoteItem.serializer, json.decode(jsonString));
  }

  static AppVoteItem? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppVoteItem.serializer, data);
    return _;
  }

  static Serializer<AppVoteItem> get serializer => _$appVoteItemSerializer;
}
