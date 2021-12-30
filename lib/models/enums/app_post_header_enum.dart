library app_post_header_enum;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_post_header_enum.g.dart';

class AppPostHeaderEnum extends EnumClass {
  static Serializer<AppPostHeaderEnum> get serializer =>
      _$appPostHeaderEnumSerializer;

  static const AppPostHeaderEnum unknown = _$unknown;
  static const AppPostHeaderEnum couple = _$couple;
  static const AppPostHeaderEnum friend = _$friend;
  static const AppPostHeaderEnum person = _$person;
  static const AppPostHeaderEnum etc = _$etc;
  static const AppPostHeaderEnum all = _$all;

  const AppPostHeaderEnum._(String name) : super(name);

  static BuiltSet<AppPostHeaderEnum> get values => _$appPostHeaderEnumValues;
  static AppPostHeaderEnum valueOf(String name) =>
      _$appPostHeaderEnumValueOf(name);

  String description() {
    String toString = '';
    switch (this) {
      case AppPostHeaderEnum.all:
        toString = '전체';
        break;
      case AppPostHeaderEnum.couple:
        toString = '커플사이';
        break;
      case AppPostHeaderEnum.friend:
        toString = '친구사이';
        break;
      case AppPostHeaderEnum.person:
        toString = '사람사이';
        break;
      case AppPostHeaderEnum.etc:
        toString = '기타';
        break;
      default:
        toString = '말머리';
    }
    return toString;
  }
}
