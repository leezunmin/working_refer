library faq;

import 'dart:convert';

import 'package:application/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'faq.g.dart';

abstract class Faq implements Built<Faq, FaqBuilder> {
  Faq._();

  factory Faq([Function(FaqBuilder b)? updates]) = _$Faq;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'question')
  String get question;
  @BuiltValueField(wireName: 'answer')
  String get answer;

  // @BuiltValueField(wireName: 'isExpanded')
  // bool get isExpanded;

  String toJson() {
    return json.encode(serializers.serializeWith(Faq.serializer, this));
  }

  Map<dynamic, dynamic> toMap() {
    return serializers.serializeWith(Faq.serializer, this)
        as Map<dynamic, dynamic>;
  }

  static Faq? fromJson(String jsonString) {
    return serializers.deserializeWith(Faq.serializer, json.decode(jsonString));
  }

  static Faq? fromMap(Map<dynamic, dynamic> data) {
    var _ = serializers.deserializeWith(Faq.serializer, data);
    return _;
  }

  static Serializer<Faq> get serializer => _$faqSerializer;
}
