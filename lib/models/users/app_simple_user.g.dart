// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_simple_user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppSimpleUser> _$appSimpleUserSerializer =
    new _$AppSimpleUserSerializer();

class _$AppSimpleUserSerializer implements StructuredSerializer<AppSimpleUser> {
  @override
  final Iterable<Type> types = const [AppSimpleUser, _$AppSimpleUser];
  @override
  final String wireName = 'AppSimpleUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppSimpleUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'orderingStamp',
      serializers.serialize(object.orderingStamp,
          specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likeType;
    if (value != null) {
      result
        ..add('likeType')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AppSimpleUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppSimpleUserBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'orderingStamp':
          result.orderingStamp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'likeType':
          result.likeType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppSimpleUser extends AppSimpleUser {
  @override
  final String id;
  @override
  final DateTime date;
  @override
  final int orderingStamp;
  @override
  final String type;
  @override
  final String? status;
  @override
  final int? likeType;

  factory _$AppSimpleUser([void Function(AppSimpleUserBuilder)? updates]) =>
      (new AppSimpleUserBuilder()..update(updates)).build();

  _$AppSimpleUser._(
      {required this.id,
      required this.date,
      required this.orderingStamp,
      required this.type,
      this.status,
      this.likeType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'AppSimpleUser', 'id');
    BuiltValueNullFieldError.checkNotNull(date, 'AppSimpleUser', 'date');
    BuiltValueNullFieldError.checkNotNull(
        orderingStamp, 'AppSimpleUser', 'orderingStamp');
    BuiltValueNullFieldError.checkNotNull(type, 'AppSimpleUser', 'type');
  }

  @override
  AppSimpleUser rebuild(void Function(AppSimpleUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppSimpleUserBuilder toBuilder() => new AppSimpleUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppSimpleUser &&
        id == other.id &&
        date == other.date &&
        orderingStamp == other.orderingStamp &&
        type == other.type &&
        status == other.status &&
        likeType == other.likeType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), date.hashCode),
                    orderingStamp.hashCode),
                type.hashCode),
            status.hashCode),
        likeType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppSimpleUser')
          ..add('id', id)
          ..add('date', date)
          ..add('orderingStamp', orderingStamp)
          ..add('type', type)
          ..add('status', status)
          ..add('likeType', likeType))
        .toString();
  }
}

class AppSimpleUserBuilder
    implements Builder<AppSimpleUser, AppSimpleUserBuilder> {
  _$AppSimpleUser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  int? _orderingStamp;
  int? get orderingStamp => _$this._orderingStamp;
  set orderingStamp(int? orderingStamp) =>
      _$this._orderingStamp = orderingStamp;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _likeType;
  int? get likeType => _$this._likeType;
  set likeType(int? likeType) => _$this._likeType = likeType;

  AppSimpleUserBuilder();

  AppSimpleUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _orderingStamp = $v.orderingStamp;
      _type = $v.type;
      _status = $v.status;
      _likeType = $v.likeType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppSimpleUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppSimpleUser;
  }

  @override
  void update(void Function(AppSimpleUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppSimpleUser build() {
    final _$result = _$v ??
        new _$AppSimpleUser._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'AppSimpleUser', 'id'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, 'AppSimpleUser', 'date'),
            orderingStamp: BuiltValueNullFieldError.checkNotNull(
                orderingStamp, 'AppSimpleUser', 'orderingStamp'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'AppSimpleUser', 'type'),
            status: status,
            likeType: likeType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
