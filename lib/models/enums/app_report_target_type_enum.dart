library app_report_target_type_enum;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_report_target_type_enum.g.dart';

class AppReportTargetTypeEnum extends EnumClass {
  static Serializer<AppReportTargetTypeEnum> get serializer =>
      _$appReportTargetTypeEnumSerializer;

  static const AppReportTargetTypeEnum user = _$user;
  static const AppReportTargetTypeEnum post = _$post;
  static const AppReportTargetTypeEnum reply = _$reply;
  static const AppReportTargetTypeEnum meet = _$meet;
  static const AppReportTargetTypeEnum blockedPhone = _$blockedPhone;
  static const AppReportTargetTypeEnum etc = _$etc;

  const AppReportTargetTypeEnum._(String name) : super(name);
  static BuiltSet<AppReportTargetTypeEnum> get values =>
      _$appReportTargetTypeEnumValues;
  static AppReportTargetTypeEnum valueOf(String name) =>
      _$appReportTargetTypeEnumValueOf(name);
}
