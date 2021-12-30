// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppUser> _$appUserSerializer = new _$AppUserSerializer();

class _$AppUserSerializer implements StructuredSerializer<AppUser> {
  @override
  final Iterable<Type> types = const [AppUser, _$AppUser];
  @override
  final String wireName = 'AppUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'emailVerified',
      serializers.serialize(object.emailVerified,
          specifiedType: const FullType(bool)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
      'profileInitailized',
      serializers.serialize(object.profileInitailized,
          specifiedType: const FullType(bool)),
      'linkedProviders',
      serializers.serialize(object.linkedProviders,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'star',
      serializers.serialize(object.star, specifiedType: const FullType(int)),
      'superLike',
      serializers.serialize(object.superLike,
          specifiedType: const FullType(int)),
      'superApply',
      serializers.serialize(object.superApply,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.temporaryAuthCode;
    if (value != null) {
      result
        ..add('temporaryAuthCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TemporaryAuthCode)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birth;
    if (value != null) {
      result
        ..add('birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.countryCode;
    if (value != null) {
      result
        ..add('countryCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fcmKey;
    if (value != null) {
      result
        ..add('fcmKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requiredTermChecked;
    if (value != null) {
      result
        ..add('requiredTermChecked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.marketingTermChecked;
    if (value != null) {
      result
        ..add('marketingTermChecked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.membership;
    if (value != null) {
      result
        ..add('membership')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppMembershipEnum)));
    }
    value = object.instaAuth;
    if (value != null) {
      result
        ..add('instaAuth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(InstaAuth)));
    }
    return result;
  }

  @override
  AppUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'emailVerified':
          result.emailVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profileInitailized':
          result.profileInitailized = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'linkedProviders':
          result.linkedProviders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'temporaryAuthCode':
          result.temporaryAuthCode.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TemporaryAuthCode))!
              as TemporaryAuthCode);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birth':
          result.birth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fcmKey':
          result.fcmKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'requiredTermChecked':
          result.requiredTermChecked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'marketingTermChecked':
          result.marketingTermChecked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'star':
          result.star = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'superLike':
          result.superLike = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'superApply':
          result.superApply = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'membership':
          result.membership = serializers.deserialize(value,
                  specifiedType: const FullType(AppMembershipEnum))
              as AppMembershipEnum?;
          break;
        case 'instaAuth':
          result.instaAuth.replace(serializers.deserialize(value,
              specifiedType: const FullType(InstaAuth))! as InstaAuth);
          break;
      }
    }

    return result.build();
  }
}

class _$AppUser extends AppUser {
  @override
  final bool emailVerified;
  @override
  final String? email;
  @override
  final String id;
  @override
  final String phoneNumber;
  @override
  final bool profileInitailized;
  @override
  final BuiltList<String> linkedProviders;
  @override
  final TemporaryAuthCode? temporaryAuthCode;
  @override
  final String? name;
  @override
  final DateTime? birth;
  @override
  final String? countryCode;
  @override
  final String? fcmKey;
  @override
  final bool? requiredTermChecked;
  @override
  final bool? marketingTermChecked;
  @override
  final int star;
  @override
  final int superLike;
  @override
  final int superApply;
  @override
  final AppMembershipEnum? membership;
  @override
  final InstaAuth? instaAuth;

  factory _$AppUser([void Function(AppUserBuilder)? updates]) =>
      (new AppUserBuilder()..update(updates)).build();

  _$AppUser._(
      {required this.emailVerified,
      this.email,
      required this.id,
      required this.phoneNumber,
      required this.profileInitailized,
      required this.linkedProviders,
      this.temporaryAuthCode,
      this.name,
      this.birth,
      this.countryCode,
      this.fcmKey,
      this.requiredTermChecked,
      this.marketingTermChecked,
      required this.star,
      required this.superLike,
      required this.superApply,
      this.membership,
      this.instaAuth})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        emailVerified, 'AppUser', 'emailVerified');
    BuiltValueNullFieldError.checkNotNull(id, 'AppUser', 'id');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, 'AppUser', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        profileInitailized, 'AppUser', 'profileInitailized');
    BuiltValueNullFieldError.checkNotNull(
        linkedProviders, 'AppUser', 'linkedProviders');
    BuiltValueNullFieldError.checkNotNull(star, 'AppUser', 'star');
    BuiltValueNullFieldError.checkNotNull(superLike, 'AppUser', 'superLike');
    BuiltValueNullFieldError.checkNotNull(superApply, 'AppUser', 'superApply');
  }

  @override
  AppUser rebuild(void Function(AppUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserBuilder toBuilder() => new AppUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppUser &&
        emailVerified == other.emailVerified &&
        email == other.email &&
        id == other.id &&
        phoneNumber == other.phoneNumber &&
        profileInitailized == other.profileInitailized &&
        linkedProviders == other.linkedProviders &&
        temporaryAuthCode == other.temporaryAuthCode &&
        name == other.name &&
        birth == other.birth &&
        countryCode == other.countryCode &&
        fcmKey == other.fcmKey &&
        requiredTermChecked == other.requiredTermChecked &&
        marketingTermChecked == other.marketingTermChecked &&
        star == other.star &&
        superLike == other.superLike &&
        superApply == other.superApply &&
        membership == other.membership &&
        instaAuth == other.instaAuth;
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
                                                                            0,
                                                                            emailVerified
                                                                                .hashCode),
                                                                        email
                                                                            .hashCode),
                                                                    id
                                                                        .hashCode),
                                                                phoneNumber
                                                                    .hashCode),
                                                            profileInitailized
                                                                .hashCode),
                                                        linkedProviders
                                                            .hashCode),
                                                    temporaryAuthCode.hashCode),
                                                name.hashCode),
                                            birth.hashCode),
                                        countryCode.hashCode),
                                    fcmKey.hashCode),
                                requiredTermChecked.hashCode),
                            marketingTermChecked.hashCode),
                        star.hashCode),
                    superLike.hashCode),
                superApply.hashCode),
            membership.hashCode),
        instaAuth.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUser')
          ..add('emailVerified', emailVerified)
          ..add('email', email)
          ..add('id', id)
          ..add('phoneNumber', phoneNumber)
          ..add('profileInitailized', profileInitailized)
          ..add('linkedProviders', linkedProviders)
          ..add('temporaryAuthCode', temporaryAuthCode)
          ..add('name', name)
          ..add('birth', birth)
          ..add('countryCode', countryCode)
          ..add('fcmKey', fcmKey)
          ..add('requiredTermChecked', requiredTermChecked)
          ..add('marketingTermChecked', marketingTermChecked)
          ..add('star', star)
          ..add('superLike', superLike)
          ..add('superApply', superApply)
          ..add('membership', membership)
          ..add('instaAuth', instaAuth))
        .toString();
  }
}

class AppUserBuilder implements Builder<AppUser, AppUserBuilder> {
  _$AppUser? _$v;

  bool? _emailVerified;
  bool? get emailVerified => _$this._emailVerified;
  set emailVerified(bool? emailVerified) =>
      _$this._emailVerified = emailVerified;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool? _profileInitailized;
  bool? get profileInitailized => _$this._profileInitailized;
  set profileInitailized(bool? profileInitailized) =>
      _$this._profileInitailized = profileInitailized;

  ListBuilder<String>? _linkedProviders;
  ListBuilder<String> get linkedProviders =>
      _$this._linkedProviders ??= new ListBuilder<String>();
  set linkedProviders(ListBuilder<String>? linkedProviders) =>
      _$this._linkedProviders = linkedProviders;

  TemporaryAuthCodeBuilder? _temporaryAuthCode;
  TemporaryAuthCodeBuilder get temporaryAuthCode =>
      _$this._temporaryAuthCode ??= new TemporaryAuthCodeBuilder();
  set temporaryAuthCode(TemporaryAuthCodeBuilder? temporaryAuthCode) =>
      _$this._temporaryAuthCode = temporaryAuthCode;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _birth;
  DateTime? get birth => _$this._birth;
  set birth(DateTime? birth) => _$this._birth = birth;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _fcmKey;
  String? get fcmKey => _$this._fcmKey;
  set fcmKey(String? fcmKey) => _$this._fcmKey = fcmKey;

  bool? _requiredTermChecked;
  bool? get requiredTermChecked => _$this._requiredTermChecked;
  set requiredTermChecked(bool? requiredTermChecked) =>
      _$this._requiredTermChecked = requiredTermChecked;

  bool? _marketingTermChecked;
  bool? get marketingTermChecked => _$this._marketingTermChecked;
  set marketingTermChecked(bool? marketingTermChecked) =>
      _$this._marketingTermChecked = marketingTermChecked;

  int? _star;
  int? get star => _$this._star;
  set star(int? star) => _$this._star = star;

  int? _superLike;
  int? get superLike => _$this._superLike;
  set superLike(int? superLike) => _$this._superLike = superLike;

  int? _superApply;
  int? get superApply => _$this._superApply;
  set superApply(int? superApply) => _$this._superApply = superApply;

  AppMembershipEnum? _membership;
  AppMembershipEnum? get membership => _$this._membership;
  set membership(AppMembershipEnum? membership) =>
      _$this._membership = membership;

  InstaAuthBuilder? _instaAuth;
  InstaAuthBuilder get instaAuth =>
      _$this._instaAuth ??= new InstaAuthBuilder();
  set instaAuth(InstaAuthBuilder? instaAuth) => _$this._instaAuth = instaAuth;

  AppUserBuilder();

  AppUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _emailVerified = $v.emailVerified;
      _email = $v.email;
      _id = $v.id;
      _phoneNumber = $v.phoneNumber;
      _profileInitailized = $v.profileInitailized;
      _linkedProviders = $v.linkedProviders.toBuilder();
      _temporaryAuthCode = $v.temporaryAuthCode?.toBuilder();
      _name = $v.name;
      _birth = $v.birth;
      _countryCode = $v.countryCode;
      _fcmKey = $v.fcmKey;
      _requiredTermChecked = $v.requiredTermChecked;
      _marketingTermChecked = $v.marketingTermChecked;
      _star = $v.star;
      _superLike = $v.superLike;
      _superApply = $v.superApply;
      _membership = $v.membership;
      _instaAuth = $v.instaAuth?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppUser;
  }

  @override
  void update(void Function(AppUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUser build() {
    _$AppUser _$result;
    try {
      _$result = _$v ??
          new _$AppUser._(
              emailVerified: BuiltValueNullFieldError.checkNotNull(
                  emailVerified, 'AppUser', 'emailVerified'),
              email: email,
              id: BuiltValueNullFieldError.checkNotNull(id, 'AppUser', 'id'),
              phoneNumber: BuiltValueNullFieldError.checkNotNull(
                  phoneNumber, 'AppUser', 'phoneNumber'),
              profileInitailized: BuiltValueNullFieldError.checkNotNull(
                  profileInitailized, 'AppUser', 'profileInitailized'),
              linkedProviders: linkedProviders.build(),
              temporaryAuthCode: _temporaryAuthCode?.build(),
              name: name,
              birth: birth,
              countryCode: countryCode,
              fcmKey: fcmKey,
              requiredTermChecked: requiredTermChecked,
              marketingTermChecked: marketingTermChecked,
              star: BuiltValueNullFieldError.checkNotNull(
                  star, 'AppUser', 'star'),
              superLike: BuiltValueNullFieldError.checkNotNull(
                  superLike, 'AppUser', 'superLike'),
              superApply: BuiltValueNullFieldError.checkNotNull(
                  superApply, 'AppUser', 'superApply'),
              membership: membership,
              instaAuth: _instaAuth?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'linkedProviders';
        linkedProviders.build();
        _$failedField = 'temporaryAuthCode';
        _temporaryAuthCode?.build();

        _$failedField = 'instaAuth';
        _instaAuth?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
