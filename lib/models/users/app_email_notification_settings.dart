library app_email_notification_settings;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_email_notification_settings.g.dart';

abstract class AppEmailNotificationSettings
    implements
        Built<AppEmailNotificationSettings,
            AppEmailNotificationSettingsBuilder> {
  AppEmailNotificationSettings._();

  factory AppEmailNotificationSettings(
          [Function(AppEmailNotificationSettingsBuilder b)? updates]) =
      _$AppEmailNotificationSettings;

  @BuiltValueField(wireName: 'connection')
  bool get connection;
  @BuiltValueField(wireName: 'message')
  bool get message;

  @BuiltValueField(wireName: 'meetingInvitation')
  bool get meetingInvitation;
  @BuiltValueField(wireName: 'meetingRecruit')
  bool get meetingRecruit;
  @BuiltValueField(wireName: 'communityReply')
  bool get communityReply;
  @BuiltValueField(wireName: 'communityLike')
  bool get communityLike;
  @BuiltValueField(wireName: 'promotion')
  bool get promotion;

  static void _initializeBuilder(AppEmailNotificationSettingsBuilder builder) =>
      builder
        ..connection = false
        ..message = false
        ..meetingInvitation = false
        ..meetingRecruit = false
        ..communityLike = false
        ..communityReply = false
        ..promotion = false;

  String toJson() {
    return json.encode(serializers.serializeWith(
        AppEmailNotificationSettings.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(
        AppEmailNotificationSettings.serializer, this) as Map<dynamic, dynamic>;
  }

  static AppEmailNotificationSettings? fromMap(Map<dynamic, dynamic> data) {
    return serializers.deserializeWith(
        AppEmailNotificationSettings.serializer, data);
  }

  static AppEmailNotificationSettings? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppEmailNotificationSettings.serializer, json.decode(jsonString));
  }

  static Serializer<AppEmailNotificationSettings> get serializer =>
      _$appEmailNotificationSettingsSerializer;
}
