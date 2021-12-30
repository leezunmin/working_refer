library qna_type_enum;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'qna_type_enum.g.dart';

class QnaTypeEnum extends EnumClass {
  static Serializer<QnaTypeEnum> get serializer => _$qnaTypeEnumSerializer;

  static const QnaTypeEnum tech = _$tech;
  static const QnaTypeEnum payment = _$payment;
  static const QnaTypeEnum bug = _$bug;
  static const QnaTypeEnum inquiry = _$inquiry;
  static const QnaTypeEnum etc = _$etc;
  static const QnaTypeEnum feedback = _$feedback;

  const QnaTypeEnum._(String name) : super(name);
  static BuiltSet<QnaTypeEnum> get values => _$qnaTypeEnumValues;
  static QnaTypeEnum valueOf(String name) => _$qnaTypeEnumValueOf(name);
}
