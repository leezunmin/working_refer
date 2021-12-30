// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_vote_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppVoteItem> _$appVoteItemSerializer = new _$AppVoteItemSerializer();

class _$AppVoteItemSerializer implements StructuredSerializer<AppVoteItem> {
  @override
  final Iterable<Type> types = const [AppVoteItem, _$AppVoteItem];
  @override
  final String wireName = 'AppVoteItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppVoteItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'voteUserArray',
      serializers.serialize(object.voteUserArray,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.itemUid;
    if (value != null) {
      result
        ..add('itemUid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.percent;
    if (value != null) {
      result
        ..add('percent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  AppVoteItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppVoteItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'itemUid':
          result.itemUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'voteUserArray':
          result.voteUserArray.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'percent':
          result.percent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppVoteItem extends AppVoteItem {
  @override
  final String? text;
  @override
  final String? id;
  @override
  final int? count;
  @override
  final String? itemUid;
  @override
  final BuiltList<String> voteUserArray;
  @override
  final double? percent;

  factory _$AppVoteItem([void Function(AppVoteItemBuilder)? updates]) =>
      (new AppVoteItemBuilder()..update(updates)).build();

  _$AppVoteItem._(
      {this.text,
      this.id,
      this.count,
      this.itemUid,
      required this.voteUserArray,
      this.percent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        voteUserArray, 'AppVoteItem', 'voteUserArray');
  }

  @override
  AppVoteItem rebuild(void Function(AppVoteItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppVoteItemBuilder toBuilder() => new AppVoteItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppVoteItem &&
        text == other.text &&
        id == other.id &&
        count == other.count &&
        itemUid == other.itemUid &&
        voteUserArray == other.voteUserArray &&
        percent == other.percent;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, text.hashCode), id.hashCode), count.hashCode),
                itemUid.hashCode),
            voteUserArray.hashCode),
        percent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppVoteItem')
          ..add('text', text)
          ..add('id', id)
          ..add('count', count)
          ..add('itemUid', itemUid)
          ..add('voteUserArray', voteUserArray)
          ..add('percent', percent))
        .toString();
  }
}

class AppVoteItemBuilder implements Builder<AppVoteItem, AppVoteItemBuilder> {
  _$AppVoteItem? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _itemUid;
  String? get itemUid => _$this._itemUid;
  set itemUid(String? itemUid) => _$this._itemUid = itemUid;

  ListBuilder<String>? _voteUserArray;
  ListBuilder<String> get voteUserArray =>
      _$this._voteUserArray ??= new ListBuilder<String>();
  set voteUserArray(ListBuilder<String>? voteUserArray) =>
      _$this._voteUserArray = voteUserArray;

  double? _percent;
  double? get percent => _$this._percent;
  set percent(double? percent) => _$this._percent = percent;

  AppVoteItemBuilder();

  AppVoteItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _id = $v.id;
      _count = $v.count;
      _itemUid = $v.itemUid;
      _voteUserArray = $v.voteUserArray.toBuilder();
      _percent = $v.percent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppVoteItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppVoteItem;
  }

  @override
  void update(void Function(AppVoteItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppVoteItem build() {
    _$AppVoteItem _$result;
    try {
      _$result = _$v ??
          new _$AppVoteItem._(
              text: text,
              id: id,
              count: count,
              itemUid: itemUid,
              voteUserArray: voteUserArray.build(),
              percent: percent);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'voteUserArray';
        voteUserArray.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppVoteItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
