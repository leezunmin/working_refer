import 'package:application/models/enums/app_post_sort_enum.dart';
import 'package:application/models/enums/models.dart';
import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_container.dart';
import 'bottom_sheet_header.dart';
import 'bottom_sheet_item.dart';

class PostSortBottomSheet extends StatefulWidget {
  final ValueChanged<AppPostSortEnum> onTap;

  const PostSortBottomSheet(this.onTap, {Key? key}) : super(key: key);
  @override
  _PostSortBottomSheetState createState() => _PostSortBottomSheetState();
}

class _PostSortBottomSheetState extends State<PostSortBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      [
        const BottomSheetHeader("보기 정렬"),
        BottomSheetItem(AppPostSortEnum.date.description(), () {
          widget.onTap(AppPostSortEnum.date);
        }),
        AppSpacers.height8,
        BottomSheetItem(AppPostSortEnum.reply.description(), () {
          widget.onTap(AppPostSortEnum.reply);
        }),
        AppSpacers.height8,
        BottomSheetItem(AppPostSortEnum.view.description(), () {
          widget.onTap(AppPostSortEnum.view);
        }),
        AppSpacers.height16,
      ],
    );
  }
}
