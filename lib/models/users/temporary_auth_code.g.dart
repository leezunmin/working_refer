// GENERATED CODE - DO NOT MODIFY BY HAND

part of temporary_auth_code;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TemporaryAuthCode> _$temporaryAuthCodeSerializer =
    new _$TemporaryAuthCodeSerializer();

class _$TemporaryAuthCodeSerializer
    implements StructuredSerializer<TemporaryAuthCode> {
  @override
  final Iterable<Type> types = const [TemporaryAuthCode, _$TemporaryAuthCode];
  @override
  final String wireName = 'TemporaryAuthCode';

  @override
  Iterable<Object?> serialize(Serializers serializers, TemporaryAuthCode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  TemporaryAuthCode deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TemporaryAuthCodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$TemporaryAuthCode extends TemporaryAuthCode {
  @override
  final String type;
  @override
  final String code;
  @override
  final String email;
  @override
  final DateTime? createdAt;

  factory _$TemporaryAuthCode(
          [void Function(TemporaryAuthCodeBuilder)? updates]) =>
      (new TemporaryAuthCodeBuilder()..update(updates)).build();

  _$TemporaryAuthCode._(
      {required this.type,
      required this.code,
      required this.email,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'TemporaryAuthCode', 'type');
    BuiltValueNullFieldError.checkNotNull(code, 'TemporaryAuthCode', 'code');
    BuiltValueNullFieldError.checkNotNull(email, 'TemporaryAuthCode', 'email');
  }

  @override
  TemporaryAuthCode rebuild(void Function(TemporaryAuthCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemporaryAuthCodeBuilder toBuilder() =>
      new TemporaryAuthCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemporaryAuthCode &&
        type == other.type &&
        code == other.code &&
        email == other.email &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, type.hashCode), code.hashCode), email.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TemporaryAuthCode')
          ..add('type', type)
          ..add('code', code)
          ..add('email', email)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class TemporaryAuthCodeBuilder
    implements Builder<TemporaryAuthCode, TemporaryAuthCodeBuilder> {
  _$TemporaryAuthCode? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  TemporaryAuthCodeBuilder();

  TemporaryAuthCodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _code = $v.code;
      _email = $v.email;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TemporaryAuthCode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemporaryAuthCode;
  }

  @override
  void update(void Function(TemporaryAuthCodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TemporaryAuthCode build() {
    final _$result = _$v ??
        new _$TemporaryAuthCode._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'TemporaryAuthCode', 'type'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, 'TemporaryAuthCode', 'code'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'TemporaryAuthCode', 'email'),
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
