// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_user_block;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppUserBlock> _$appUserBlockSerializer =
    new _$AppUserBlockSerializer();

class _$AppUserBlockSerializer implements StructuredSerializer<AppUserBlock> {
  @override
  final Iterable<Type> types = const [AppUserBlock, _$AppUserBlock];
  @override
  final String wireName = 'AppUserBlock';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppUserBlock object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'allBlock',
      serializers.serialize(object.allBlock,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'phoneBlock',
      serializers.serialize(object.phoneBlock,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'faceBookBlock',
      serializers.serialize(object.faceBookBlock,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.faceBookBlocked;
    if (value != null) {
      result
        ..add('faceBookBlocked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  AppUserBlock deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppUserBlockBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'faceBookBlocked':
          result.faceBookBlocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'allBlock':
          result.allBlock.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'phoneBlock':
          result.phoneBlock.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'faceBookBlock':
          result.faceBookBlock.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AppUserBlock extends AppUserBlock {
  @override
  final String userId;
  @override
  final bool? faceBookBlocked;
  @override
  final BuiltList<String> allBlock;
  @override
  final BuiltList<String> phoneBlock;
  @override
  final BuiltList<String> faceBookBlock;

  factory _$AppUserBlock([void Function(AppUserBlockBuilder)? updates]) =>
      (new AppUserBlockBuilder()..update(updates)).build();

  _$AppUserBlock._(
      {required this.userId,
      this.faceBookBlocked,
      required this.allBlock,
      required this.phoneBlock,
      required this.faceBookBlock})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'AppUserBlock', 'userId');
    BuiltValueNullFieldError.checkNotNull(allBlock, 'AppUserBlock', 'allBlock');
    BuiltValueNullFieldError.checkNotNull(
        phoneBlock, 'AppUserBlock', 'phoneBlock');
    BuiltValueNullFieldError.checkNotNull(
        faceBookBlock, 'AppUserBlock', 'faceBookBlock');
  }

  @override
  AppUserBlock rebuild(void Function(AppUserBlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserBlockBuilder toBuilder() => new AppUserBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppUserBlock &&
        userId == other.userId &&
        faceBookBlocked == other.faceBookBlocked &&
        allBlock == other.allBlock &&
        phoneBlock == other.phoneBlock &&
        faceBookBlock == other.faceBookBlock;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, userId.hashCode), faceBookBlocked.hashCode),
                allBlock.hashCode),
            phoneBlock.hashCode),
        faceBookBlock.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUserBlock')
          ..add('userId', userId)
          ..add('faceBookBlocked', faceBookBlocked)
          ..add('allBlock', allBlock)
          ..add('phoneBlock', phoneBlock)
          ..add('faceBookBlock', faceBookBlock))
        .toString();
  }
}

class AppUserBlockBuilder
    implements Builder<AppUserBlock, AppUserBlockBuilder> {
  _$AppUserBlock? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  bool? _faceBookBlocked;
  bool? get faceBookBlocked => _$this._faceBookBlocked;
  set faceBookBlocked(bool? faceBookBlocked) =>
      _$this._faceBookBlocked = faceBookBlocked;

  ListBuilder<String>? _allBlock;
  ListBuilder<String> get allBlock =>
      _$this._allBlock ??= new ListBuilder<String>();
  set allBlock(ListBuilder<String>? allBlock) => _$this._allBlock = allBlock;

  ListBuilder<String>? _phoneBlock;
  ListBuilder<String> get phoneBlock =>
      _$this._phoneBlock ??= new ListBuilder<String>();
  set phoneBlock(ListBuilder<String>? phoneBlock) =>
      _$this._phoneBlock = phoneBlock;

  ListBuilder<String>? _faceBookBlock;
  ListBuilder<String> get faceBookBlock =>
      _$this._faceBookBlock ??= new ListBuilder<String>();
  set faceBookBlock(ListBuilder<String>? faceBookBlock) =>
      _$this._faceBookBlock = faceBookBlock;

  AppUserBlockBuilder();

  AppUserBlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _faceBookBlocked = $v.faceBookBlocked;
      _allBlock = $v.allBlock.toBuilder();
      _phoneBlock = $v.phoneBlock.toBuilder();
      _faceBookBlock = $v.faceBookBlock.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUserBlock other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppUserBlock;
  }

  @override
  void update(void Function(AppUserBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUserBlock build() {
    _$AppUserBlock _$result;
    try {
      _$result = _$v ??
          new _$AppUserBlock._(
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'AppUserBlock', 'userId'),
              faceBookBlocked: faceBookBlocked,
              allBlock: allBlock.build(),
              phoneBlock: phoneBlock.build(),
              faceBookBlock: faceBookBlock.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allBlock';
        allBlock.build();
        _$failedField = 'phoneBlock';
        phoneBlock.build();
        _$failedField = 'faceBookBlock';
        faceBookBlock.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppUserBlock', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
