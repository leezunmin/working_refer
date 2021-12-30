// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_user_profile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppUserProfile> _$appUserProfileSerializer =
    new _$AppUserProfileSerializer();

class _$AppUserProfileSerializer
    implements StructuredSerializer<AppUserProfile> {
  @override
  final Iterable<Type> types = const [AppUserProfile, _$AppUserProfile];
  @override
  final String wireName = 'AppUserProfile';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppUserProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'nickName',
      serializers.serialize(object.nickName,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender, specifiedType: const FullType(int)),
      'targetGender',
      serializers.serialize(object.targetGender,
          specifiedType: const FullType(int)),
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
      'newLikes',
      serializers.serialize(object.newLikes,
          specifiedType: const FullType(int)),
      'newMessages',
      serializers.serialize(object.newMessages,
          specifiedType: const FullType(int)),
      'aboutMe',
      serializers.serialize(object.aboutMe,
          specifiedType: const FullType(String)),
      'favorites',
      serializers.serialize(object.favorites,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'favoriteSubjects',
      serializers.serialize(object.favoriteSubjects,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AppMeetSubjectEnum)])),
      'company',
      serializers.serialize(object.company,
          specifiedType: const FullType(String)),
      'maxDistance',
      serializers.serialize(object.maxDistance,
          specifiedType: const FullType(int)),
      'profileHidden',
      serializers.serialize(object.profileHidden,
          specifiedType: const FullType(bool)),
      'deleted',
      serializers.serialize(object.deleted,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.instaUserId;
    if (value != null) {
      result
        ..add('instaUserId')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.birth;
    if (value != null) {
      result
        ..add('birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.newLikesCheckedAt;
    if (value != null) {
      result
        ..add('newLikesCheckedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.school;
    if (value != null) {
      result
        ..add('school')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoPath;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.local;
    if (value != null) {
      result
        ..add('local')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.localDetail;
    if (value != null) {
      result
        ..add('localDetail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppKakaoLocalSearchDocumentAddress)));
    }
    value = object.minAge;
    if (value != null) {
      result
        ..add('minAge')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxAge;
    if (value != null) {
      result
        ..add('maxAge')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.instaMediaIds;
    if (value != null) {
      result
        ..add('instaMediaIds')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(InstaMedia)])));
    }
    value = object.certificationStatus;
    if (value != null) {
      result
        ..add('certificationStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppProfileCertificationStatusEnum)));
    }
    value = object.pushNotificationSettings;
    if (value != null) {
      result
        ..add('pushNotificationSettings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppPushNotificationSettings)));
    }
    value = object.emailNotificationSettings;
    if (value != null) {
      result
        ..add('emailNotificationSettings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppEmailNotificationSettings)));
    }
    return result;
  }

  @override
  AppUserProfile deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppUserProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instaUserId':
          result.instaUserId = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'nickName':
          result.nickName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'targetGender':
          result.targetGender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'newLikes':
          result.newLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'newMessages':
          result.newMessages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'birth':
          result.birth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'newLikesCheckedAt':
          result.newLikesCheckedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'school':
          result.school = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'aboutMe':
          result.aboutMe = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photoPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favorites':
          result.favorites.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'favoriteSubjects':
          result.favoriteSubjects.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AppMeetSubjectEnum)]))!
              as BuiltList<Object?>);
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'local':
          result.local = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'localDetail':
          result.localDetail.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(AppKakaoLocalSearchDocumentAddress))!
              as AppKakaoLocalSearchDocumentAddress);
          break;
        case 'minAge':
          result.minAge = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'maxAge':
          result.maxAge = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'maxDistance':
          result.maxDistance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'profileHidden':
          result.profileHidden = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deleted':
          result.deleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'instaMediaIds':
          result.instaMediaIds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(InstaMedia)]))!
              as BuiltList<Object?>);
          break;
        case 'certificationStatus':
          result.certificationStatus = serializers.deserialize(value,
                  specifiedType:
                      const FullType(AppProfileCertificationStatusEnum))
              as AppProfileCertificationStatusEnum?;
          break;
        case 'pushNotificationSettings':
          result.pushNotificationSettings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AppPushNotificationSettings))!
              as AppPushNotificationSettings);
          break;
        case 'emailNotificationSettings':
          result.emailNotificationSettings.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(AppEmailNotificationSettings))!
              as AppEmailNotificationSettings);
          break;
      }
    }

    return result.build();
  }
}

class _$AppUserProfile extends AppUserProfile {
  @override
  final String id;
  @override
  final num? instaUserId;
  @override
  final String nickName;
  @override
  final int gender;
  @override
  final int targetGender;
  @override
  final int stars;
  @override
  final int newLikes;
  @override
  final int newMessages;
  @override
  final DateTime? birth;
  @override
  final DateTime? newLikesCheckedAt;
  @override
  final String? school;
  @override
  final String aboutMe;
  @override
  final String? photoPath;
  @override
  final BuiltList<String> favorites;
  @override
  final BuiltList<AppMeetSubjectEnum> favoriteSubjects;
  @override
  final String company;
  @override
  final String? local;
  @override
  final AppKakaoLocalSearchDocumentAddress? localDetail;
  @override
  final int? minAge;
  @override
  final int? maxAge;
  @override
  final int maxDistance;
  @override
  final bool profileHidden;
  @override
  final bool deleted;
  @override
  final BuiltList<InstaMedia>? instaMediaIds;
  @override
  final AppProfileCertificationStatusEnum? certificationStatus;
  @override
  final AppPushNotificationSettings? pushNotificationSettings;
  @override
  final AppEmailNotificationSettings? emailNotificationSettings;

  factory _$AppUserProfile([void Function(AppUserProfileBuilder)? updates]) =>
      (new AppUserProfileBuilder()..update(updates)).build();

  _$AppUserProfile._(
      {required this.id,
      this.instaUserId,
      required this.nickName,
      required this.gender,
      required this.targetGender,
      required this.stars,
      required this.newLikes,
      required this.newMessages,
      this.birth,
      this.newLikesCheckedAt,
      this.school,
      required this.aboutMe,
      this.photoPath,
      required this.favorites,
      required this.favoriteSubjects,
      required this.company,
      this.local,
      this.localDetail,
      this.minAge,
      this.maxAge,
      required this.maxDistance,
      required this.profileHidden,
      required this.deleted,
      this.instaMediaIds,
      this.certificationStatus,
      this.pushNotificationSettings,
      this.emailNotificationSettings})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'AppUserProfile', 'id');
    BuiltValueNullFieldError.checkNotNull(
        nickName, 'AppUserProfile', 'nickName');
    BuiltValueNullFieldError.checkNotNull(gender, 'AppUserProfile', 'gender');
    BuiltValueNullFieldError.checkNotNull(
        targetGender, 'AppUserProfile', 'targetGender');
    BuiltValueNullFieldError.checkNotNull(stars, 'AppUserProfile', 'stars');
    BuiltValueNullFieldError.checkNotNull(
        newLikes, 'AppUserProfile', 'newLikes');
    BuiltValueNullFieldError.checkNotNull(
        newMessages, 'AppUserProfile', 'newMessages');
    BuiltValueNullFieldError.checkNotNull(aboutMe, 'AppUserProfile', 'aboutMe');
    BuiltValueNullFieldError.checkNotNull(
        favorites, 'AppUserProfile', 'favorites');
    BuiltValueNullFieldError.checkNotNull(
        favoriteSubjects, 'AppUserProfile', 'favoriteSubjects');
    BuiltValueNullFieldError.checkNotNull(company, 'AppUserProfile', 'company');
    BuiltValueNullFieldError.checkNotNull(
        maxDistance, 'AppUserProfile', 'maxDistance');
    BuiltValueNullFieldError.checkNotNull(
        profileHidden, 'AppUserProfile', 'profileHidden');
    BuiltValueNullFieldError.checkNotNull(deleted, 'AppUserProfile', 'deleted');
  }

  @override
  AppUserProfile rebuild(void Function(AppUserProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserProfileBuilder toBuilder() =>
      new AppUserProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppUserProfile &&
        id == other.id &&
        instaUserId == other.instaUserId &&
        nickName == other.nickName &&
        gender == other.gender &&
        targetGender == other.targetGender &&
        stars == other.stars &&
        newLikes == other.newLikes &&
        newMessages == other.newMessages &&
        birth == other.birth &&
        newLikesCheckedAt == other.newLikesCheckedAt &&
        school == other.school &&
        aboutMe == other.aboutMe &&
        photoPath == other.photoPath &&
        favorites == other.favorites &&
        favoriteSubjects == other.favoriteSubjects &&
        company == other.company &&
        local == other.local &&
        localDetail == other.localDetail &&
        minAge == other.minAge &&
        maxAge == other.maxAge &&
        maxDistance == other.maxDistance &&
        profileHidden == other.profileHidden &&
        deleted == other.deleted &&
        instaMediaIds == other.instaMediaIds &&
        certificationStatus == other.certificationStatus &&
        pushNotificationSettings == other.pushNotificationSettings &&
        emailNotificationSettings == other.emailNotificationSettings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), instaUserId.hashCode), nickName.hashCode), gender.hashCode), targetGender.hashCode), stars.hashCode), newLikes.hashCode), newMessages.hashCode),
                                                                                birth.hashCode),
                                                                            newLikesCheckedAt.hashCode),
                                                                        school.hashCode),
                                                                    aboutMe.hashCode),
                                                                photoPath.hashCode),
                                                            favorites.hashCode),
                                                        favoriteSubjects.hashCode),
                                                    company.hashCode),
                                                local.hashCode),
                                            localDetail.hashCode),
                                        minAge.hashCode),
                                    maxAge.hashCode),
                                maxDistance.hashCode),
                            profileHidden.hashCode),
                        deleted.hashCode),
                    instaMediaIds.hashCode),
                certificationStatus.hashCode),
            pushNotificationSettings.hashCode),
        emailNotificationSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUserProfile')
          ..add('id', id)
          ..add('instaUserId', instaUserId)
          ..add('nickName', nickName)
          ..add('gender', gender)
          ..add('targetGender', targetGender)
          ..add('stars', stars)
          ..add('newLikes', newLikes)
          ..add('newMessages', newMessages)
          ..add('birth', birth)
          ..add('newLikesCheckedAt', newLikesCheckedAt)
          ..add('school', school)
          ..add('aboutMe', aboutMe)
          ..add('photoPath', photoPath)
          ..add('favorites', favorites)
          ..add('favoriteSubjects', favoriteSubjects)
          ..add('company', company)
          ..add('local', local)
          ..add('localDetail', localDetail)
          ..add('minAge', minAge)
          ..add('maxAge', maxAge)
          ..add('maxDistance', maxDistance)
          ..add('profileHidden', profileHidden)
          ..add('deleted', deleted)
          ..add('instaMediaIds', instaMediaIds)
          ..add('certificationStatus', certificationStatus)
          ..add('pushNotificationSettings', pushNotificationSettings)
          ..add('emailNotificationSettings', emailNotificationSettings))
        .toString();
  }
}

class AppUserProfileBuilder
    implements Builder<AppUserProfile, AppUserProfileBuilder> {
  _$AppUserProfile? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  num? _instaUserId;
  num? get instaUserId => _$this._instaUserId;
  set instaUserId(num? instaUserId) => _$this._instaUserId = instaUserId;

  String? _nickName;
  String? get nickName => _$this._nickName;
  set nickName(String? nickName) => _$this._nickName = nickName;

  int? _gender;
  int? get gender => _$this._gender;
  set gender(int? gender) => _$this._gender = gender;

  int? _targetGender;
  int? get targetGender => _$this._targetGender;
  set targetGender(int? targetGender) => _$this._targetGender = targetGender;

  int? _stars;
  int? get stars => _$this._stars;
  set stars(int? stars) => _$this._stars = stars;

  int? _newLikes;
  int? get newLikes => _$this._newLikes;
  set newLikes(int? newLikes) => _$this._newLikes = newLikes;

  int? _newMessages;
  int? get newMessages => _$this._newMessages;
  set newMessages(int? newMessages) => _$this._newMessages = newMessages;

  DateTime? _birth;
  DateTime? get birth => _$this._birth;
  set birth(DateTime? birth) => _$this._birth = birth;

  DateTime? _newLikesCheckedAt;
  DateTime? get newLikesCheckedAt => _$this._newLikesCheckedAt;
  set newLikesCheckedAt(DateTime? newLikesCheckedAt) =>
      _$this._newLikesCheckedAt = newLikesCheckedAt;

  String? _school;
  String? get school => _$this._school;
  set school(String? school) => _$this._school = school;

  String? _aboutMe;
  String? get aboutMe => _$this._aboutMe;
  set aboutMe(String? aboutMe) => _$this._aboutMe = aboutMe;

  String? _photoPath;
  String? get photoPath => _$this._photoPath;
  set photoPath(String? photoPath) => _$this._photoPath = photoPath;

  ListBuilder<String>? _favorites;
  ListBuilder<String> get favorites =>
      _$this._favorites ??= new ListBuilder<String>();
  set favorites(ListBuilder<String>? favorites) =>
      _$this._favorites = favorites;

  ListBuilder<AppMeetSubjectEnum>? _favoriteSubjects;
  ListBuilder<AppMeetSubjectEnum> get favoriteSubjects =>
      _$this._favoriteSubjects ??= new ListBuilder<AppMeetSubjectEnum>();
  set favoriteSubjects(ListBuilder<AppMeetSubjectEnum>? favoriteSubjects) =>
      _$this._favoriteSubjects = favoriteSubjects;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  String? _local;
  String? get local => _$this._local;
  set local(String? local) => _$this._local = local;

  AppKakaoLocalSearchDocumentAddressBuilder? _localDetail;
  AppKakaoLocalSearchDocumentAddressBuilder get localDetail =>
      _$this._localDetail ??= new AppKakaoLocalSearchDocumentAddressBuilder();
  set localDetail(AppKakaoLocalSearchDocumentAddressBuilder? localDetail) =>
      _$this._localDetail = localDetail;

  int? _minAge;
  int? get minAge => _$this._minAge;
  set minAge(int? minAge) => _$this._minAge = minAge;

  int? _maxAge;
  int? get maxAge => _$this._maxAge;
  set maxAge(int? maxAge) => _$this._maxAge = maxAge;

  int? _maxDistance;
  int? get maxDistance => _$this._maxDistance;
  set maxDistance(int? maxDistance) => _$this._maxDistance = maxDistance;

  bool? _profileHidden;
  bool? get profileHidden => _$this._profileHidden;
  set profileHidden(bool? profileHidden) =>
      _$this._profileHidden = profileHidden;

  bool? _deleted;
  bool? get deleted => _$this._deleted;
  set deleted(bool? deleted) => _$this._deleted = deleted;

  ListBuilder<InstaMedia>? _instaMediaIds;
  ListBuilder<InstaMedia> get instaMediaIds =>
      _$this._instaMediaIds ??= new ListBuilder<InstaMedia>();
  set instaMediaIds(ListBuilder<InstaMedia>? instaMediaIds) =>
      _$this._instaMediaIds = instaMediaIds;

  AppProfileCertificationStatusEnum? _certificationStatus;
  AppProfileCertificationStatusEnum? get certificationStatus =>
      _$this._certificationStatus;
  set certificationStatus(
          AppProfileCertificationStatusEnum? certificationStatus) =>
      _$this._certificationStatus = certificationStatus;

  AppPushNotificationSettingsBuilder? _pushNotificationSettings;
  AppPushNotificationSettingsBuilder get pushNotificationSettings =>
      _$this._pushNotificationSettings ??=
          new AppPushNotificationSettingsBuilder();
  set pushNotificationSettings(
          AppPushNotificationSettingsBuilder? pushNotificationSettings) =>
      _$this._pushNotificationSettings = pushNotificationSettings;

  AppEmailNotificationSettingsBuilder? _emailNotificationSettings;
  AppEmailNotificationSettingsBuilder get emailNotificationSettings =>
      _$this._emailNotificationSettings ??=
          new AppEmailNotificationSettingsBuilder();
  set emailNotificationSettings(
          AppEmailNotificationSettingsBuilder? emailNotificationSettings) =>
      _$this._emailNotificationSettings = emailNotificationSettings;

  AppUserProfileBuilder() {
    AppUserProfile._initializeBuilder(this);
  }

  AppUserProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _instaUserId = $v.instaUserId;
      _nickName = $v.nickName;
      _gender = $v.gender;
      _targetGender = $v.targetGender;
      _stars = $v.stars;
      _newLikes = $v.newLikes;
      _newMessages = $v.newMessages;
      _birth = $v.birth;
      _newLikesCheckedAt = $v.newLikesCheckedAt;
      _school = $v.school;
      _aboutMe = $v.aboutMe;
      _photoPath = $v.photoPath;
      _favorites = $v.favorites.toBuilder();
      _favoriteSubjects = $v.favoriteSubjects.toBuilder();
      _company = $v.company;
      _local = $v.local;
      _localDetail = $v.localDetail?.toBuilder();
      _minAge = $v.minAge;
      _maxAge = $v.maxAge;
      _maxDistance = $v.maxDistance;
      _profileHidden = $v.profileHidden;
      _deleted = $v.deleted;
      _instaMediaIds = $v.instaMediaIds?.toBuilder();
      _certificationStatus = $v.certificationStatus;
      _pushNotificationSettings = $v.pushNotificationSettings?.toBuilder();
      _emailNotificationSettings = $v.emailNotificationSettings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUserProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppUserProfile;
  }

  @override
  void update(void Function(AppUserProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUserProfile build() {
    _$AppUserProfile _$result;
    try {
      _$result = _$v ??
          new _$AppUserProfile._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'AppUserProfile', 'id'),
              instaUserId: instaUserId,
              nickName: BuiltValueNullFieldError.checkNotNull(
                  nickName, 'AppUserProfile', 'nickName'),
              gender: BuiltValueNullFieldError.checkNotNull(
                  gender, 'AppUserProfile', 'gender'),
              targetGender: BuiltValueNullFieldError.checkNotNull(
                  targetGender, 'AppUserProfile', 'targetGender'),
              stars: BuiltValueNullFieldError.checkNotNull(
                  stars, 'AppUserProfile', 'stars'),
              newLikes: BuiltValueNullFieldError.checkNotNull(
                  newLikes, 'AppUserProfile', 'newLikes'),
              newMessages: BuiltValueNullFieldError.checkNotNull(
                  newMessages, 'AppUserProfile', 'newMessages'),
              birth: birth,
              newLikesCheckedAt: newLikesCheckedAt,
              school: school,
              aboutMe: BuiltValueNullFieldError.checkNotNull(
                  aboutMe, 'AppUserProfile', 'aboutMe'),
              photoPath: photoPath,
              favorites: favorites.build(),
              favoriteSubjects: favoriteSubjects.build(),
              company: BuiltValueNullFieldError.checkNotNull(
                  company, 'AppUserProfile', 'company'),
              local: local,
              localDetail: _localDetail?.build(),
              minAge: minAge,
              maxAge: maxAge,
              maxDistance: BuiltValueNullFieldError.checkNotNull(maxDistance, 'AppUserProfile', 'maxDistance'),
              profileHidden: BuiltValueNullFieldError.checkNotNull(profileHidden, 'AppUserProfile', 'profileHidden'),
              deleted: BuiltValueNullFieldError.checkNotNull(deleted, 'AppUserProfile', 'deleted'),
              instaMediaIds: _instaMediaIds?.build(),
              certificationStatus: certificationStatus,
              pushNotificationSettings: _pushNotificationSettings?.build(),
              emailNotificationSettings: _emailNotificationSettings?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favorites';
        favorites.build();
        _$failedField = 'favoriteSubjects';
        favoriteSubjects.build();

        _$failedField = 'localDetail';
        _localDetail?.build();

        _$failedField = 'instaMediaIds';
        _instaMediaIds?.build();

        _$failedField = 'pushNotificationSettings';
        _pushNotificationSettings?.build();
        _$failedField = 'emailNotificationSettings';
        _emailNotificationSettings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppUserProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
