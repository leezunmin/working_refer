// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_community_enum;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppCommunityEnum _$isPostInit = const AppCommunityEnum._('isPostInit');
const AppCommunityEnum _$isUploading = const AppCommunityEnum._('isUploading');
const AppCommunityEnum _$readVote = const AppCommunityEnum._('readVote');
const AppCommunityEnum _$editVote = const AppCommunityEnum._('editVote');
const AppCommunityEnum _$editValidate =
    const AppCommunityEnum._('editValidate');
const AppCommunityEnum _$writeValidate =
    const AppCommunityEnum._('writeValidate');
const AppCommunityEnum _$statusTagged =
    const AppCommunityEnum._('statusTagged');
const AppCommunityEnum _$statusUnTagged =
    const AppCommunityEnum._('statusUnTagged');

AppCommunityEnum _$appCommunityEnumValueOf(String name) {
  switch (name) {
    case 'isPostInit':
      return _$isPostInit;
    case 'isUploading':
      return _$isUploading;
    case 'readVote':
      return _$readVote;
    case 'editVote':
      return _$editVote;
    case 'editValidate':
      return _$editValidate;
    case 'writeValidate':
      return _$writeValidate;
    case 'statusTagged':
      return _$statusTagged;
    case 'statusUnTagged':
      return _$statusUnTagged;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppCommunityEnum> _$appPostHeaderEnumValues =
    new BuiltSet<AppCommunityEnum>(const <AppCommunityEnum>[
  _$isPostInit,
  _$isUploading,
  _$readVote,
  _$editVote,
  _$editValidate,
  _$writeValidate,
  _$statusTagged,
  _$statusUnTagged,
]);

Serializer<AppCommunityEnum> _$appCommunityEnumSerializer =
    new _$AppCommunityEnumSerializer();

class _$AppCommunityEnumSerializer
    implements PrimitiveSerializer<AppCommunityEnum> {
  @override
  final Iterable<Type> types = const <Type>[AppCommunityEnum];
  @override
  final String wireName = 'AppCommunityEnum';

  @override
  Object serialize(Serializers serializers, AppCommunityEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppCommunityEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppCommunityEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
