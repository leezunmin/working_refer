library app_community_enum;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_community_enum.g.dart';

class AppCommunityEnum extends EnumClass {
  static Serializer<AppCommunityEnum> get serializer =>
      _$appCommunityEnumSerializer;

  static const AppCommunityEnum isPostInit = _$isPostInit;
  static const AppCommunityEnum isUploading = _$isUploading;

  // 투표
  static const AppCommunityEnum readVote = _$readVote;
  static const AppCommunityEnum editVote = _$editVote;

  // 검증 타입
  static const AppCommunityEnum editValidate = _$editValidate;
  static const AppCommunityEnum writeValidate = _$writeValidate;

  // 태그 여부
  static const AppCommunityEnum statusTagged = _$statusTagged;
  static const AppCommunityEnum statusUnTagged = _$statusUnTagged;

  const AppCommunityEnum._(String name) : super(name);

  static BuiltSet<AppCommunityEnum> get values => _$appPostHeaderEnumValues;

  static AppCommunityEnum valueOf(String name) =>
      _$appCommunityEnumValueOf(name);

  String desc() {
    String toString = '';
    switch (this) {
      case AppCommunityEnum.isPostInit:
        toString = 'isPostInit';
        break;
      case AppCommunityEnum.isUploading:
        toString = 'isUploading';
        break;
      case AppCommunityEnum.readVote:
        toString = 'readVote';
        break;
      case AppCommunityEnum.editVote:
        toString = 'editVote';
        break;

      case AppCommunityEnum.editValidate:
        toString = 'editValidate';
        break;
      case AppCommunityEnum.writeValidate:
        toString = 'writeValidate';
        break;

      case AppCommunityEnum.statusTagged:
        toString = 'statusTagged';
        break;
      case AppCommunityEnum.statusUnTagged:
        toString = 'statusUnTagged';
        break;

      // default:toString = '말머리';

    }
    return toString;
  }
}
