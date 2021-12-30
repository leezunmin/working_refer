library app_user;

import 'dart:convert';

import 'package:application/models/models.dart';
import 'package:application/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  AppUser._();

  factory AppUser([Function(AppUserBuilder b)? updates]) = _$AppUser;

  @BuiltValueField(wireName: 'emailVerified')
  bool get emailVerified;

  @BuiltValueField(wireName: 'email')
  String? get email;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'phoneNumber')
  String get phoneNumber;

  @BuiltValueField(wireName: 'profileInitailized')
  bool get profileInitailized;

  @BuiltValueField(wireName: 'linkedProviders')
  BuiltList<String> get linkedProviders;

  @BuiltValueField(wireName: 'temporaryAuthCode')
  TemporaryAuthCode? get temporaryAuthCode;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'birth')
  DateTime? get birth;

  @BuiltValueField(wireName: 'countryCode')
  String? get countryCode;

  @BuiltValueField(wireName: 'fcmKey')
  String? get fcmKey;

  @BuiltValueField(wireName: 'requiredTermChecked')
  bool? get requiredTermChecked;

  @BuiltValueField(wireName: 'marketingTermChecked')
  bool? get marketingTermChecked;

  @BuiltValueField(wireName: 'star')
  int get star;
  @BuiltValueField(wireName: 'superLike')
  int get superLike;
  @BuiltValueField(wireName: 'superApply')
  int get superApply;

  @BuiltValueField(wireName: 'membership')
  AppMembershipEnum? get membership;

  @BuiltValueField(wireName: 'instaAuth')
  InstaAuth? get instaAuth;

  String toJson() {
    return json.encode(serializers.serializeWith(AppUser.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(AppUser.serializer, this)
        as Map<String, dynamic>;
  }

  static AppUser? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppUser.serializer, json.decode(jsonString));
  }

  static AppUser? fromMap(Map<dynamic, dynamic>? data) {
    var _ = serializers.deserializeWith(AppUser.serializer, data);
    return _;
  }

  static Serializer<AppUser> get serializer => _$appUserSerializer;

  bool get temporaryAuthCodeUnExpired {
    if (temporaryAuthCode != null) {
      DateTime now = DateTime.now();
      DateTime ex = temporaryAuthCode!.createdAt!
          .add(const Duration(seconds: Duration.secondsPerMinute * 30));
      if (ex.millisecondsSinceEpoch > now.millisecondsSinceEpoch) {
        return true;
      }
    }

    return false;
  }
}
