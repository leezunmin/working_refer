import 'package:application/models/enums/models.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/widgets/bottom_sheet/bottom_sheet_container.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_header.dart';
import 'bottom_sheet_item.dart';

class PostHeaderBottomSheet extends StatefulWidget {
  final ValueChanged<AppPostHeaderEnum> onTap;

  const PostHeaderBottomSheet(this.onTap, {Key? key}) : super(key: key);
  @override
  _PostHeaderBottomSheetState createState() => _PostHeaderBottomSheetState();
}

class _PostHeaderBottomSheetState extends State<PostHeaderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      [
        const BottomSheetHeader("말머리"),
        BottomSheetItem(AppPostHeaderEnum.all.description(), () {
          widget.onTap(AppPostHeaderEnum.all);
        }),
        BottomSheetItem(AppPostHeaderEnum.couple.description(), () {
          widget.onTap(AppPostHeaderEnum.couple);
        }),
        BottomSheetItem(AppPostHeaderEnum.friend.description(), () {
          widget.onTap(AppPostHeaderEnum.friend);
        }),
        BottomSheetItem(AppPostHeaderEnum.person.description(), () {
          widget.onTap(AppPostHeaderEnum.person);
        }),
        BottomSheetItem(AppPostHeaderEnum.etc.description(), () {
          widget.onTap(AppPostHeaderEnum.etc);
        }),
        AppSpacers.height16,
      ],
    );
  }
}
