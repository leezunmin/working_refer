// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_post_header_enum;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppPostHeaderEnum _$unknown = const AppPostHeaderEnum._('unknown');
const AppPostHeaderEnum _$couple = const AppPostHeaderEnum._('couple');
const AppPostHeaderEnum _$friend = const AppPostHeaderEnum._('friend');
const AppPostHeaderEnum _$person = const AppPostHeaderEnum._('person');
const AppPostHeaderEnum _$etc = const AppPostHeaderEnum._('etc');
const AppPostHeaderEnum _$all = const AppPostHeaderEnum._('all');

AppPostHeaderEnum _$appPostHeaderEnumValueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$unknown;
    case 'couple':
      return _$couple;
    case 'friend':
      return _$friend;
    case 'person':
      return _$person;
    case 'etc':
      return _$etc;
    case 'all':
      return _$all;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppPostHeaderEnum> _$appPostHeaderEnumValues =
    new BuiltSet<AppPostHeaderEnum>(const <AppPostHeaderEnum>[
  _$unknown,
  _$couple,
  _$friend,
  _$person,
  _$etc,
  _$all,
]);

Serializer<AppPostHeaderEnum> _$appPostHeaderEnumSerializer =
    new _$AppPostHeaderEnumSerializer();

class _$AppPostHeaderEnumSerializer
    implements PrimitiveSerializer<AppPostHeaderEnum> {
  @override
  final Iterable<Type> types = const <Type>[AppPostHeaderEnum];
  @override
  final String wireName = 'AppPostHeaderEnum';

  @override
  Object serialize(Serializers serializers, AppPostHeaderEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppPostHeaderEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppPostHeaderEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
