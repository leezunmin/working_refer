import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_container.dart';
import 'bottom_sheet_header.dart';
import 'bottom_sheet_item.dart';

class PostReportBottomSheet extends StatefulWidget {
  final ValueChanged<int> onTap;

  const PostReportBottomSheet(this.onTap, {Key? key}) : super(key: key);
  @override
  _PostReportBottomSheetState createState() => _PostReportBottomSheetState();
}

class _PostReportBottomSheetState extends State<PostReportBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      [
        const BottomSheetHeader("더 보기"),
        BottomSheetItem("신고하기", () {
          widget.onTap(0);
        }),
        AppSpacers.height16,
      ],
    );
  }
}
