library app_post_type_enum;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_post_type_enum.g.dart';

class AppPostTypeEnum extends EnumClass {
  static Serializer<AppPostTypeEnum> get serializer =>
      _$appPostTypeEnumSerializer;

  static const AppPostTypeEnum post = _$post;
  static const AppPostTypeEnum reply = _$reply;

  const AppPostTypeEnum._(String name) : super(name);
  static BuiltSet<AppPostTypeEnum> get values => _$appPostTypeEnumValues;
  static AppPostTypeEnum valueOf(String name) => _$appPostTypeEnumValueOf(name);
}
