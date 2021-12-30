import 'dart:io';

import 'package:application/models/enums/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_container.dart';

class ReportEtcBottomSheet extends StatefulWidget {
  final Repository? repo;
  final String? userId;
  final String? targetId;
  final AppReportTargetTypeEnum? targetType;

  const ReportEtcBottomSheet(
      this.repo, this.userId, this.targetId, this.targetType,
      {Key? key})
      : super(key: key);
  @override
  _ReportEtcBottomSheetState createState() => _ReportEtcBottomSheetState();
}

class _ReportEtcBottomSheetState extends State<ReportEtcBottomSheet> {
  Repository? repo;
  String? userId;
  String? targetId;
  AppReportTargetTypeEnum? targetType;
  TextEditingController? textEditingController;
  bool processing = false;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    repo = widget.repo;
    userId = widget.userId;
    targetId = widget.targetId;
    targetType = widget.targetType;
  }

  File? _image;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BottomSheetContainer(
      [
        const BottomSheetHeader(
          "신고하기",
          subTitle: '상대방에게 신고 사실이 공개되지 않아요.',
        ),
        AppSpacers.height16,
        Container(
          padding: AppEdgeInsets.horizontal16,
          child: RRectOutlineTextField(
            height: 180,
            maxLines: 25,
            maxLength: 500,
            alignment: Alignment.topCenter,
            controller: textEditingController,
            textInputAction: TextInputAction.done,
            onChanged: (v) {},
            onSubmitted: (v) {
              FocusScope.of(context).unfocus();
            },
            hintText: '내용은 최대 500자까지 작성 가능해요.',
            textAlignVertical: TextAlignVertical.top,
          ),
        ),
        AppSpacers.height16,
        Container(
          padding: AppEdgeInsets.horizontal16,
          child: Row(
            children: [
              Flexible(
                child: AppElevatedButton(
                  const Text('취소하기'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  size: ButtonSize.medium,
                  align: ButtonAlign.stretch,
                  colorType: ButtonColor.gray,
                  shape: ButtonShape.rounded,
                ),
              ),
              AppSpacers.width16,
              Flexible(
                child: AppElevatedButton(
                  const Text('신고하기'),
                  onPressed: () async {
                    Navigator.of(context).pop(textEditingController!.text);
                    if (textEditingController!.text.isNotEmpty &&
                        // textEditingController.text.length > 0 &&
                        !processing) {
                      processing = true;
                      await repo!.addReport(userId, targetId, targetType,
                          textEditingController!.text);

                      Navigator.of(context).pop('etc');
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('차단 및 신고처리 되었습니다.'),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  },
                  size: ButtonSize.medium,
                  align: ButtonAlign.stretch,
                  colorType: ButtonColor.primary,
                  shape: ButtonShape.rounded,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
