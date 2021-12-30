library app_vote;

import 'dart:convert';

import 'package:application/models/datas/app_vote_item.dart';
import 'package:application/models/models.dart';
import 'package:application/serializers/serializers.dart';
import 'package:application/utils/utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_vote.g.dart';

abstract class AppVote implements Built<AppVote, AppVoteBuilder> {
  AppVote._();

  factory AppVote([Function(AppVoteBuilder b)? updates]) = _$AppVote;

  @BuiltValueField(wireName: 'voteUid')
  String? get voteUid;
  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'expireDate')
  DateTime get expireDate;
  @BuiltValueField(wireName: 'items')
  BuiltList<AppVoteItem?> get items;
  @BuiltValueField(wireName: 'isExpired')
  bool? get isExpired;
  @BuiltValueField(wireName: 'voteCount')
  int? get voteCount;

  String toJson() {
    return json.encode(serializers.serializeWith(AppVote.serializer, this));
  }

  static AppVote? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppVote.serializer, json.decode(jsonString));
  }

  static AppVote? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppVote.serializer, data);
    return _;
  }

  static Serializer<AppVote> get serializer => _$appVoteSerializer;

  static AppVote? makeVote(String title, int expire, List<AppVoteItem> itmes) {
    DateTime now = DateTime.now();
    DateTime ex = now.add(Duration(days: expire));
    return AppVote.fromMap({
      "title": title,
      "expireDate": timeMapToDateTime(ex),
      "items": itmes.map((e) => e.toMap()),
      "isExpired": false,
      "voteCount": 0
    });
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppVote.serializer, this)
        as Map<dynamic, dynamic>;
  }
}
