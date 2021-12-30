// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_report_target_type_enum;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppReportTargetTypeEnum _$user = const AppReportTargetTypeEnum._('user');
const AppReportTargetTypeEnum _$post = const AppReportTargetTypeEnum._('post');
const AppReportTargetTypeEnum _$reply =
    const AppReportTargetTypeEnum._('reply');
const AppReportTargetTypeEnum _$meet = const AppReportTargetTypeEnum._('meet');
const AppReportTargetTypeEnum _$blockedPhone =
    const AppReportTargetTypeEnum._('blockedPhone');
const AppReportTargetTypeEnum _$etc = const AppReportTargetTypeEnum._('etc');

AppReportTargetTypeEnum _$appReportTargetTypeEnumValueOf(String name) {
  switch (name) {
    case 'user':
      return _$user;
    case 'post':
      return _$post;
    case 'reply':
      return _$reply;
    case 'meet':
      return _$meet;
    case 'blockedPhone':
      return _$blockedPhone;
    case 'etc':
      return _$etc;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppReportTargetTypeEnum> _$appReportTargetTypeEnumValues =
    new BuiltSet<AppReportTargetTypeEnum>(const <AppReportTargetTypeEnum>[
  _$user,
  _$post,
  _$reply,
  _$meet,
  _$blockedPhone,
  _$etc,
]);

Serializer<AppReportTargetTypeEnum> _$appReportTargetTypeEnumSerializer =
    new _$AppReportTargetTypeEnumSerializer();

class _$AppReportTargetTypeEnumSerializer
    implements PrimitiveSerializer<AppReportTargetTypeEnum> {
  @override
  final Iterable<Type> types = const <Type>[AppReportTargetTypeEnum];
  @override
  final String wireName = 'AppReportTargetTypeEnum';

  @override
  Object serialize(Serializers serializers, AppReportTargetTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppReportTargetTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppReportTargetTypeEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
