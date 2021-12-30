// GENERATED CODE - DO NOT MODIFY BY HAND

part of qna_type_enum;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const QnaTypeEnum _$tech = const QnaTypeEnum._('tech');
const QnaTypeEnum _$payment = const QnaTypeEnum._('payment');
const QnaTypeEnum _$bug = const QnaTypeEnum._('bug');
const QnaTypeEnum _$inquiry = const QnaTypeEnum._('inquiry');
const QnaTypeEnum _$etc = const QnaTypeEnum._('etc');
const QnaTypeEnum _$feedback = const QnaTypeEnum._('feedback');

QnaTypeEnum _$qnaTypeEnumValueOf(String name) {
  switch (name) {
    case 'tech':
      return _$tech;
    case 'payment':
      return _$payment;
    case 'bug':
      return _$bug;
    case 'inquiry':
      return _$inquiry;
    case 'etc':
      return _$etc;
    case 'feedback':
      return _$feedback;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<QnaTypeEnum> _$qnaTypeEnumValues =
    new BuiltSet<QnaTypeEnum>(const <QnaTypeEnum>[
  _$tech,
  _$payment,
  _$bug,
  _$inquiry,
  _$etc,
  _$feedback,
]);

Serializer<QnaTypeEnum> _$qnaTypeEnumSerializer = new _$QnaTypeEnumSerializer();

class _$QnaTypeEnumSerializer implements PrimitiveSerializer<QnaTypeEnum> {
  @override
  final Iterable<Type> types = const <Type>[QnaTypeEnum];
  @override
  final String wireName = 'QnaTypeEnum';

  @override
  Object serialize(Serializers serializers, QnaTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  QnaTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      QnaTypeEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
