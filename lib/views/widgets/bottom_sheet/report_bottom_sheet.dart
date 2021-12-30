// import 'package:application/models/enums/models.dart';
// import 'package:application/repositories/repository.dart';
// import 'package:application/styles/styles.dart';
// import 'package:application/views/views.dart';
// import 'package:flutter/material.dart';

// import 'bottom_sheet_container.dart';

// class ReportBottomSheet extends StatefulWidget {
//   final Repository? repo;
//   final String? userId;
//   final String? targetId;
//   final AppReportTargetTypeEnum targetType;
//   const ReportBottomSheet(
//       this.repo, this.userId, this.targetId, this.targetType,
//       {Key? key})
//       : super(key: key);
//   @override
//   _ReportBottomSheetState createState() => _ReportBottomSheetState();
// }

// class _ReportBottomSheetState extends State<ReportBottomSheet> {
//   Repository? repo;
//   String? userId;
//   String? targetId;
//   AppReportTargetTypeEnum? targetType;
//   List<String> contentList = [
//     '미성년자',
//     '허위 프로필/스팸',
//     '부적절한 자기소개',
//     '부적절한 사진',
//     '사용자 차단',
//     // '기타'
//   ];
//   String? selectedContent;
//   String etcContent = '';
//   bool processing = false;
//   void _selectItem(String content) {
//     setState(() {
//       selectedContent = content;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     repo = widget.repo;
//     userId = widget.userId;
//     targetId = widget.targetId;
//     targetType = widget.targetType;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return BottomSheetContainer(
//       [
//         const BottomSheetHeader("신고 및 차단하기"),
//         AppSpacers.height8,
//         ...contentList
//             .map((e) => _item(e, selectedContent == e, () => _selectItem(e))),
//         _item('기타', selectedContent == '기타', () {
//           if (selectedContent != null) {
//             Navigator.of(context).pop(selectedContent);
//           }

//           showModalBottomSheet(
//               context: context,
//               useRootNavigator: true,
//               isScrollControlled: true,
//               builder: (context) {
//                 return ReportEtcBottomSheet(repo, userId, targetId, targetType);
//               }).then((value) {
//             if (value != null && value is String && value.isNotEmpty) {
//               if (selectedContent == null) {
//                 // Navigator.of(context).pop('기타');
//               }
//             }
//           });
//         }),
//         AppSpacers.height8,
//         Container(
//           padding: AppEdgeInsets.horizontal16,
//           child: AppElevatedButton(
//             const Text('차단하고 신고하기'),
//             onPressed: () async {
//               if (selectedContent != null && !processing) {
//                 processing = true;
//                 await repo!
//                     .addReport(userId, targetId, targetType, selectedContent);
//               }

//               // Navigator.of(context).pop(selectedContent);

//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                 content: Text('차단 및 신고처리 되었습니다.'),
//                 duration: Duration(seconds: 1),
//               ));

//               Navigator.of(context).pop(selectedContent);
//               // Navigator.of(context).pop(selectedContent);
//             },
//             align: ButtonAlign.stretch,
//             shape: ButtonShape.rounded,
//             size: ButtonSize.medium,
//           ),
//         ),
//         AppSpacers.height16,
//       ],
//     );
//   }

//   _item(
//     String title,
//     bool isSelected,
//     VoidCallback onTap,
//   ) {
//     var theme = Theme.of(context);
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: AppEdgeInsets.vertical8,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             AppSpacers.width16,
//             Icon(Icons.circle,
//                 size: AppTokens.k16,
//                 color: isSelected ? AppColors.primary : AppColors.border),
//             AppSpacers.width16,
//             Text(
//               title,
//               style: theme.textTheme.subtitle2!.apply(color: AppColors.text50),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
