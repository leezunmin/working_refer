library app_user_profile;

import 'dart:convert';

import 'package:application/models/models.dart';
import 'package:application/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_user_profile.g.dart';

abstract class AppUserProfile
    implements Built<AppUserProfile, AppUserProfileBuilder> {
  AppUserProfile._();

  factory AppUserProfile([Function(AppUserProfileBuilder b)? updates]) =
      _$AppUserProfile;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'instaUserId')
  num? get instaUserId;
  @BuiltValueField(wireName: 'nickName')
  String get nickName;
  @BuiltValueField(wireName: 'gender')
  int get gender;
  @BuiltValueField(wireName: 'targetGender')
  int get targetGender;
  @BuiltValueField(wireName: 'stars')
  int get stars;
  @BuiltValueField(wireName: 'newLikes')
  int get newLikes;
  @BuiltValueField(wireName: 'newMessages')
  int get newMessages;
  @BuiltValueField(wireName: 'birth')
  DateTime? get birth;
  @BuiltValueField(wireName: 'newLikesCheckedAt')
  DateTime? get newLikesCheckedAt;
  @BuiltValueField(wireName: 'school')
  String? get school;
  @BuiltValueField(wireName: 'aboutMe')
  String get aboutMe;
  @BuiltValueField(wireName: 'photo')
  String? get photoPath;
  @BuiltValueField(wireName: 'favorites')
  BuiltList<String> get favorites;
  @BuiltValueField(wireName: 'favoriteSubjects')
  BuiltList<AppMeetSubjectEnum> get favoriteSubjects;
  @BuiltValueField(wireName: 'company')
  String get company;
  @BuiltValueField(wireName: 'local')
  String? get local;
  @BuiltValueField(wireName: 'localDetail')
  AppKakaoLocalSearchDocumentAddress? get localDetail;
  @BuiltValueField(wireName: 'minAge')
  int? get minAge;
  @BuiltValueField(wireName: 'maxAge')
  int? get maxAge;
  @BuiltValueField(wireName: 'maxDistance')
  int get maxDistance;
  @BuiltValueField(wireName: 'profileHidden')
  bool get profileHidden;
  @BuiltValueField(wireName: 'deleted')
  bool get deleted;
  @BuiltValueField(wireName: 'instaMediaIds')
  BuiltList<InstaMedia>? get instaMediaIds;
  @BuiltValueField(wireName: 'certificationStatus')
  AppProfileCertificationStatusEnum? get certificationStatus;

  @BuiltValueField(wireName: 'pushNotificationSettings')
  AppPushNotificationSettings? get pushNotificationSettings;
  @BuiltValueField(wireName: 'emailNotificationSettings')
  AppEmailNotificationSettings? get emailNotificationSettings;

  String get photoUrl => photoPath == null
      ? ''
      : 'https://bemy-prod.imgix.net/${photoPath!.substring(7)}';

  String get photoUrlDev => photoPath == null
      ? ''
      : 'https://bemy-dev.imgix.net/${photoPath!.substring(7)}';

  static void _initializeBuilder(AppUserProfileBuilder builder) => builder
    ..nickName = ''
    ..gender = 2
    ..stars = 0
    ..minAge = 0
    ..maxAge = 0
    ..maxDistance = 0
    ..newLikes = 0
    ..newMessages = 0
    ..profileHidden = false
    ..birth = null
    ..school = ''
    ..aboutMe = ''
    ..targetGender = 2
    ..deleted = false
    // ..photos = BuiltList<String>([]).toBuilder()
    ..company = ''
    ..local = null
    ..certificationStatus = AppProfileCertificationStatusEnum.init
    ..pushNotificationSettings = AppPushNotificationSettingsBuilder()
    ..emailNotificationSettings = AppEmailNotificationSettingsBuilder();

  String toJson() {
    return json
        .encode(serializers.serializeWith(AppUserProfile.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(AppUserProfile.serializer, this)
        as Map<dynamic, dynamic>;
  }

  static AppUserProfile? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppUserProfile.serializer, json.decode(jsonString));
  }

  static AppUserProfile? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(AppUserProfile.serializer, data);
    return _;
  }

  static Serializer<AppUserProfile> get serializer =>
      _$appUserProfileSerializer;

  int get age {
    if (birth == null) return 0;
    return ((DateTime.now().difference(birth!).inDays) / 365).floor();
  }

  String get ageString => "$age";

  static AppUserProfile dummyProfile() {
    return AppUserProfile((b) => {
          b
            ..id = ''
            ..aboutMe = ''
            ..birth = DateTime.now()
            ..certificationStatus = AppProfileCertificationStatusEnum.init
            ..company = ''
            ..favorites = ListBuilder([])
            ..gender = 2
            ..local = ''
            ..newLikes = 0
            ..newMessages = 0
            ..nickName = ''
            ..photoPath = 'images/defualt_avatar.png'
            ..school = ''
            ..stars = 0
        });
  }
}
