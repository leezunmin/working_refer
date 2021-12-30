// GENERATED CODE - DO NOT MODIFY BY HAND

part of insta_auth;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InstaAuth> _$instaAuthSerializer = new _$InstaAuthSerializer();

class _$InstaAuthSerializer implements StructuredSerializer<InstaAuth> {
  @override
  final Iterable<Type> types = const [InstaAuth, _$InstaAuth];
  @override
  final String wireName = 'InstaAuth';

  @override
  Iterable<Object?> serialize(Serializers serializers, InstaAuth object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.accessToken;
    if (value != null) {
      result
        ..add('accessToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('userName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userFullName;
    if (value != null) {
      result
        ..add('userFullName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilePicture;
    if (value != null) {
      result
        ..add('profilePicture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InstaAuth deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InstaAuthBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userFullName':
          result.userFullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profilePicture':
          result.profilePicture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$InstaAuth extends InstaAuth {
  @override
  final num? userId;
  @override
  final String? accessToken;
  @override
  final String? userName;
  @override
  final String? userFullName;
  @override
  final String? profilePicture;

  factory _$InstaAuth([void Function(InstaAuthBuilder)? updates]) =>
      (new InstaAuthBuilder()..update(updates)).build();

  _$InstaAuth._(
      {this.userId,
      this.accessToken,
      this.userName,
      this.userFullName,
      this.profilePicture})
      : super._();

  @override
  InstaAuth rebuild(void Function(InstaAuthBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstaAuthBuilder toBuilder() => new InstaAuthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InstaAuth &&
        userId == other.userId &&
        accessToken == other.accessToken &&
        userName == other.userName &&
        userFullName == other.userFullName &&
        profilePicture == other.profilePicture;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, userId.hashCode), accessToken.hashCode),
                userName.hashCode),
            userFullName.hashCode),
        profilePicture.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InstaAuth')
          ..add('userId', userId)
          ..add('accessToken', accessToken)
          ..add('userName', userName)
          ..add('userFullName', userFullName)
          ..add('profilePicture', profilePicture))
        .toString();
  }
}

class InstaAuthBuilder implements Builder<InstaAuth, InstaAuthBuilder> {
  _$InstaAuth? _$v;

  num? _userId;
  num? get userId => _$this._userId;
  set userId(num? userId) => _$this._userId = userId;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _userFullName;
  String? get userFullName => _$this._userFullName;
  set userFullName(String? userFullName) => _$this._userFullName = userFullName;

  String? _profilePicture;
  String? get profilePicture => _$this._profilePicture;
  set profilePicture(String? profilePicture) =>
      _$this._profilePicture = profilePicture;

  InstaAuthBuilder();

  InstaAuthBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _accessToken = $v.accessToken;
      _userName = $v.userName;
      _userFullName = $v.userFullName;
      _profilePicture = $v.profilePicture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InstaAuth other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InstaAuth;
  }

  @override
  void update(void Function(InstaAuthBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InstaAuth build() {
    final _$result = _$v ??
        new _$InstaAuth._(
            userId: userId,
            accessToken: accessToken,
            userName: userName,
            userFullName: userFullName,
            profilePicture: profilePicture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
