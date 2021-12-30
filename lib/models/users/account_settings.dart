library account_settings;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_settings.g.dart';

abstract class AccountSettings
    implements Built<AccountSettings, AccountSettingsBuilder> {
  AccountSettings._();

  factory AccountSettings([Function(AccountSettingsBuilder b)? updates]) =
      _$AccountSettings;

  @BuiltValueField(wireName: 'maxLengthOfTarget')
  int get maxLengthOfTarget;
  @BuiltValueField(wireName: 'rangeOfTargetAge')
  BuiltList<int> get rangeOfTargetAge;
  @BuiltValueField(wireName: 'targetGender')
  int get targetGender;
  @BuiltValueField(wireName: 'hideProfile')
  bool get hideProfile;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AccountSettings.serializer, this));
  }

  static AccountSettings? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AccountSettings.serializer, json.decode(jsonString));
  }

  static AccountSettings? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AccountSettings.serializer, data);
    return _;
  }

  static Serializer<AccountSettings> get serializer =>
      _$accountSettingsSerializer;
}
