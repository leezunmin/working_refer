// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_post_type_enum;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppPostTypeEnum _$post = const AppPostTypeEnum._('post');
const AppPostTypeEnum _$reply = const AppPostTypeEnum._('reply');

AppPostTypeEnum _$appPostTypeEnumValueOf(String name) {
  switch (name) {
    case 'post':
      return _$post;
    case 'reply':
      return _$reply;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppPostTypeEnum> _$appPostTypeEnumValues =
    new BuiltSet<AppPostTypeEnum>(const <AppPostTypeEnum>[
  _$post,
  _$reply,
]);

Serializer<AppPostTypeEnum> _$appPostTypeEnumSerializer =
    new _$AppPostTypeEnumSerializer();

class _$AppPostTypeEnumSerializer
    implements PrimitiveSerializer<AppPostTypeEnum> {
  @override
  final Iterable<Type> types = const <Type>[AppPostTypeEnum];
  @override
  final String wireName = 'AppPostTypeEnum';

  @override
  Object serialize(Serializers serializers, AppPostTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppPostTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppPostTypeEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
