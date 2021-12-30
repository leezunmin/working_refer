library app_post_sort_enum;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_post_sort_enum.g.dart';

class AppPostSortEnum extends EnumClass {
  static Serializer<AppPostSortEnum> get serializer =>
      _$appPostSortEnumSerializer;

  // static const AppPostSortEnum unknown = _$unknown;
  static const AppPostSortEnum date = _$date;
  static const AppPostSortEnum reply = _$reply;
  static const AppPostSortEnum view = _$view;

  const AppPostSortEnum._(String name) : super(name);
  static BuiltSet<AppPostSortEnum> get values => _$appPostSortValues;
  static AppPostSortEnum valueOf(String name) => _$appPostSortValueOf(name);

  String description() {
    String toString = '';
    switch (this) {
      case AppPostSortEnum.date:
        toString = '최신순';
        break;
      case AppPostSortEnum.reply:
        toString = '댓글순';
        break;
      case AppPostSortEnum.view:
        toString = '조회순';
        break;

      default:
        toString = '보기정렬';
    }
    return toString;
  }
}
