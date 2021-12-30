// GENERATED CODE - DO NOT MODIFY BY HAND

part of account_settings;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountSettings> _$accountSettingsSerializer =
    new _$AccountSettingsSerializer();

class _$AccountSettingsSerializer
    implements StructuredSerializer<AccountSettings> {
  @override
  final Iterable<Type> types = const [AccountSettings, _$AccountSettings];
  @override
  final String wireName = 'AccountSettings';

  @override
  Iterable<Object?> serialize(Serializers serializers, AccountSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'maxLengthOfTarget',
      serializers.serialize(object.maxLengthOfTarget,
          specifiedType: const FullType(int)),
      'rangeOfTargetAge',
      serializers.serialize(object.rangeOfTargetAge,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'targetGender',
      serializers.serialize(object.targetGender,
          specifiedType: const FullType(int)),
      'hideProfile',
      serializers.serialize(object.hideProfile,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AccountSettings deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'maxLengthOfTarget':
          result.maxLengthOfTarget = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rangeOfTargetAge':
          result.rangeOfTargetAge.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'targetGender':
          result.targetGender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hideProfile':
          result.hideProfile = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountSettings extends AccountSettings {
  @override
  final int maxLengthOfTarget;
  @override
  final BuiltList<int> rangeOfTargetAge;
  @override
  final int targetGender;
  @override
  final bool hideProfile;

  factory _$AccountSettings([void Function(AccountSettingsBuilder)? updates]) =>
      (new AccountSettingsBuilder()..update(updates)).build();

  _$AccountSettings._(
      {required this.maxLengthOfTarget,
      required this.rangeOfTargetAge,
      required this.targetGender,
      required this.hideProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        maxLengthOfTarget, 'AccountSettings', 'maxLengthOfTarget');
    BuiltValueNullFieldError.checkNotNull(
        rangeOfTargetAge, 'AccountSettings', 'rangeOfTargetAge');
    BuiltValueNullFieldError.checkNotNull(
        targetGender, 'AccountSettings', 'targetGender');
    BuiltValueNullFieldError.checkNotNull(
        hideProfile, 'AccountSettings', 'hideProfile');
  }

  @override
  AccountSettings rebuild(void Function(AccountSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountSettingsBuilder toBuilder() =>
      new AccountSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountSettings &&
        maxLengthOfTarget == other.maxLengthOfTarget &&
        rangeOfTargetAge == other.rangeOfTargetAge &&
        targetGender == other.targetGender &&
        hideProfile == other.hideProfile;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, maxLengthOfTarget.hashCode), rangeOfTargetAge.hashCode),
            targetGender.hashCode),
        hideProfile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountSettings')
          ..add('maxLengthOfTarget', maxLengthOfTarget)
          ..add('rangeOfTargetAge', rangeOfTargetAge)
          ..add('targetGender', targetGender)
          ..add('hideProfile', hideProfile))
        .toString();
  }
}

class AccountSettingsBuilder
    implements Builder<AccountSettings, AccountSettingsBuilder> {
  _$AccountSettings? _$v;

  int? _maxLengthOfTarget;
  int? get maxLengthOfTarget => _$this._maxLengthOfTarget;
  set maxLengthOfTarget(int? maxLengthOfTarget) =>
      _$this._maxLengthOfTarget = maxLengthOfTarget;

  ListBuilder<int>? _rangeOfTargetAge;
  ListBuilder<int> get rangeOfTargetAge =>
      _$this._rangeOfTargetAge ??= new ListBuilder<int>();
  set rangeOfTargetAge(ListBuilder<int>? rangeOfTargetAge) =>
      _$this._rangeOfTargetAge = rangeOfTargetAge;

  int? _targetGender;
  int? get targetGender => _$this._targetGender;
  set targetGender(int? targetGender) => _$this._targetGender = targetGender;

  bool? _hideProfile;
  bool? get hideProfile => _$this._hideProfile;
  set hideProfile(bool? hideProfile) => _$this._hideProfile = hideProfile;

  AccountSettingsBuilder();

  AccountSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _maxLengthOfTarget = $v.maxLengthOfTarget;
      _rangeOfTargetAge = $v.rangeOfTargetAge.toBuilder();
      _targetGender = $v.targetGender;
      _hideProfile = $v.hideProfile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountSettings;
  }

  @override
  void update(void Function(AccountSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountSettings build() {
    _$AccountSettings _$result;
    try {
      _$result = _$v ??
          new _$AccountSettings._(
              maxLengthOfTarget: BuiltValueNullFieldError.checkNotNull(
                  maxLengthOfTarget, 'AccountSettings', 'maxLengthOfTarget'),
              rangeOfTargetAge: rangeOfTargetAge.build(),
              targetGender: BuiltValueNullFieldError.checkNotNull(
                  targetGender, 'AccountSettings', 'targetGender'),
              hideProfile: BuiltValueNullFieldError.checkNotNull(
                  hideProfile, 'AccountSettings', 'hideProfile'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rangeOfTargetAge';
        rangeOfTargetAge.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AccountSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
