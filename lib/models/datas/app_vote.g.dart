// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_vote;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppVote> _$appVoteSerializer = new _$AppVoteSerializer();

class _$AppVoteSerializer implements StructuredSerializer<AppVote> {
  @override
  final Iterable<Type> types = const [AppVote, _$AppVote];
  @override
  final String wireName = 'AppVote';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppVote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'expireDate',
      serializers.serialize(object.expireDate,
          specifiedType: const FullType(DateTime)),
      'items',
      serializers.serialize(object.items,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(AppVoteItem)])),
    ];
    Object? value;
    value = object.voteUid;
    if (value != null) {
      result
        ..add('voteUid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isExpired;
    if (value != null) {
      result
        ..add('isExpired')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.voteCount;
    if (value != null) {
      result
        ..add('voteCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AppVote deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppVoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'voteUid':
          result.voteUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expireDate':
          result.expireDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType.nullable(AppVoteItem)]))!
              as BuiltList<Object?>);
          break;
        case 'isExpired':
          result.isExpired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'voteCount':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppVote extends AppVote {
  @override
  final String? voteUid;
  @override
  final String title;
  @override
  final DateTime expireDate;
  @override
  final BuiltList<AppVoteItem?> items;
  @override
  final bool? isExpired;
  @override
  final int? voteCount;

  factory _$AppVote([void Function(AppVoteBuilder)? updates]) =>
      (new AppVoteBuilder()..update(updates)).build();

  _$AppVote._(
      {this.voteUid,
      required this.title,
      required this.expireDate,
      required this.items,
      this.isExpired,
      this.voteCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, 'AppVote', 'title');
    BuiltValueNullFieldError.checkNotNull(expireDate, 'AppVote', 'expireDate');
    BuiltValueNullFieldError.checkNotNull(items, 'AppVote', 'items');
  }

  @override
  AppVote rebuild(void Function(AppVoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppVoteBuilder toBuilder() => new AppVoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppVote &&
        voteUid == other.voteUid &&
        title == other.title &&
        expireDate == other.expireDate &&
        items == other.items &&
        isExpired == other.isExpired &&
        voteCount == other.voteCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, voteUid.hashCode), title.hashCode),
                    expireDate.hashCode),
                items.hashCode),
            isExpired.hashCode),
        voteCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppVote')
          ..add('voteUid', voteUid)
          ..add('title', title)
          ..add('expireDate', expireDate)
          ..add('items', items)
          ..add('isExpired', isExpired)
          ..add('voteCount', voteCount))
        .toString();
  }
}

class AppVoteBuilder implements Builder<AppVote, AppVoteBuilder> {
  _$AppVote? _$v;

  String? _voteUid;
  String? get voteUid => _$this._voteUid;
  set voteUid(String? voteUid) => _$this._voteUid = voteUid;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _expireDate;
  DateTime? get expireDate => _$this._expireDate;
  set expireDate(DateTime? expireDate) => _$this._expireDate = expireDate;

  ListBuilder<AppVoteItem?>? _items;
  ListBuilder<AppVoteItem?> get items =>
      _$this._items ??= new ListBuilder<AppVoteItem?>();
  set items(ListBuilder<AppVoteItem?>? items) => _$this._items = items;

  bool? _isExpired;
  bool? get isExpired => _$this._isExpired;
  set isExpired(bool? isExpired) => _$this._isExpired = isExpired;

  int? _voteCount;
  int? get voteCount => _$this._voteCount;
  set voteCount(int? voteCount) => _$this._voteCount = voteCount;

  AppVoteBuilder();

  AppVoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _voteUid = $v.voteUid;
      _title = $v.title;
      _expireDate = $v.expireDate;
      _items = $v.items.toBuilder();
      _isExpired = $v.isExpired;
      _voteCount = $v.voteCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppVote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppVote;
  }

  @override
  void update(void Function(AppVoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppVote build() {
    _$AppVote _$result;
    try {
      _$result = _$v ??
          new _$AppVote._(
              voteUid: voteUid,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'AppVote', 'title'),
              expireDate: BuiltValueNullFieldError.checkNotNull(
                  expireDate, 'AppVote', 'expireDate'),
              items: items.build(),
              isExpired: isExpired,
              voteCount: voteCount);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppVote', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
