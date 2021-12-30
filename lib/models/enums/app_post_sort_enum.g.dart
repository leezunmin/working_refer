// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_post_sort_enum;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppPostSortEnum _$date = const AppPostSortEnum._('date');
const AppPostSortEnum _$reply = const AppPostSortEnum._('reply');
const AppPostSortEnum _$view = const AppPostSortEnum._('view');

AppPostSortEnum _$appPostSortValueOf(String name) {
  switch (name) {
    case 'date':
      return _$date;
    case 'reply':
      return _$reply;
    case 'view':
      return _$view;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppPostSortEnum> _$appPostSortValues =
    new BuiltSet<AppPostSortEnum>(const <AppPostSortEnum>[
  _$date,
  _$reply,
  _$view,
]);

Serializer<AppPostSortEnum> _$appPostSortEnumSerializer =
    new _$AppPostSortEnumSerializer();

class _$AppPostSortEnumSerializer
    implements PrimitiveSerializer<AppPostSortEnum> {
  @override
  final Iterable<Type> types = const <Type>[AppPostSortEnum];
  @override
  final String wireName = 'AppPostSortEnum';

  @override
  Object serialize(Serializers serializers, AppPostSortEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppPostSortEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppPostSortEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
