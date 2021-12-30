import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/auth/auth_state_service.dart';
import 'package:application/styles/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_sheet_container.dart';
import 'bottom_sheet_header.dart';
import 'bottom_sheet_item.dart';

class PostMoreBottomSheet extends StatefulWidget {
  final ValueChanged<int> onTap;
  final dynamic collection;

  const PostMoreBottomSheet(this.onTap, this.collection, {Key? key})
      : super(key: key);

  @override
  _PostMoreBottomSheetState createState() => _PostMoreBottomSheetState();
}

class _PostMoreBottomSheetState extends State<PostMoreBottomSheet> {
  _PostMoreBottomSheetState();

  FirebaseFirestore? _db;
  Repository? _repo;
  AppPost? post;
  AppReply? reply;
  late AuthStateService _authStateService;
  Me? me;
  bool? isValied;
  late dynamic collection = widget.collection;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _authStateService = context.read<AuthStateService>();
    me = _authStateService.currentMe;
    collection = collection;
    validateUser(collection);
  }

  bool? validateUser(dynamic collection) {
    me!.id == collection.ownerId.toString()
        ? isValied = true
        : isValied = false;
    return isValied;
  }

  @override
  Widget build(BuildContext context) {
    /*return BottomSheetContainer(
      [
        BottomSheetHeader("더 보기"),
        BottomSheetItem("신고하기", () {widget.onTap(0); }),
        BottomSheetItem("삭제하기", () async {widget.onTap(1); }),
        AppSpacers.height16,
      ],
    );*/

    // isValied == true ? BottomSheetValied : BottomSheetOther;

    switch (isValied) {
      case true:
        return BottomSheetValied();
      case false:
      default:
        return BottomSheetOther();
    }
  }

  Widget BottomSheetValied() {
    return BottomSheetContainer(
      [
        const BottomSheetHeader("더 보기"),
        collection.collectionType == 'post'
            ? BottomSheetItem("수정하기", () {
                widget.onTap(0);
              })
            : const SizedBox(),
        BottomSheetItem("삭제하기", () async {
          widget.onTap(1);
        }),
        AppSpacers.height16,
      ],
    );
  }

  Widget BottomSheetOther() {
    return BottomSheetContainer(
      [
        const BottomSheetHeader("더 보기"),
        BottomSheetItem("신고하기", () {
          widget.onTap(2);
        }),
        AppSpacers.height16,
      ],
    );
  }
}
