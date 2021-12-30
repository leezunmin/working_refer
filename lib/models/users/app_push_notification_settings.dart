library app_push_notification_settings;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_push_notification_settings.g.dart';

abstract class AppPushNotificationSettings
    implements
        Built<AppPushNotificationSettings, AppPushNotificationSettingsBuilder> {
  AppPushNotificationSettings._();

  factory AppPushNotificationSettings(
          [Function(AppPushNotificationSettingsBuilder b)? updates]) =
      _$AppPushNotificationSettings;

  @BuiltValueField(wireName: 'connection')
  bool get connection;
  @BuiltValueField(wireName: 'message')
  bool get message;
  @BuiltValueField(wireName: 'groupMessage')
  bool get groupMessage;
  @BuiltValueField(wireName: 'like')
  bool get like;
  @BuiltValueField(wireName: 'superLike')
  bool get superLike;
  @BuiltValueField(wireName: 'invitation')
  bool get invitation;
  @BuiltValueField(wireName: 'approveInvitation')
  bool get approveInvitation;
  @BuiltValueField(wireName: 'schedule')
  bool get schedule;
  @BuiltValueField(wireName: 'vibration')
  bool get vibration;
  @BuiltValueField(wireName: 'reply')
  bool get reply;
  @BuiltValueField(wireName: 'postLike')
  bool get postLike;

  static void _initializeBuilder(AppPushNotificationSettingsBuilder builder) =>
      builder
        ..connection = false
        ..message = false
        ..groupMessage = false
        ..like = false
        ..superLike = false
        ..invitation = false
        ..approveInvitation = false
        ..schedule = false
        ..vibration = false
        ..reply = false
        ..postLike = false;

  String toJson() {
    return json.encode(serializers.serializeWith(
        AppPushNotificationSettings.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(
        AppPushNotificationSettings.serializer, this) as Map<dynamic, dynamic>;
  }

  static AppPushNotificationSettings? fromMap(Map<dynamic, dynamic> data) {
    return serializers.deserializeWith(
        AppPushNotificationSettings.serializer, data);
  }

  static AppPushNotificationSettings? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppPushNotificationSettings.serializer, json.decode(jsonString));
  }

  static Serializer<AppPushNotificationSettings> get serializer =>
      _$appPushNotificationSettingsSerializer;
}
