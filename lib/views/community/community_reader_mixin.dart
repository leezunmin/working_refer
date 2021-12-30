import 'package:application/blocs/blocs.dart';
import 'package:application/blocs/validate_mixin.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/typos.dart';
import 'package:application/utils/utils.dart';
import 'package:application/views/community/widgets/post_photo_modal.dart';
import 'package:application/views/widgets/bottom_sheet/post_more_bottom_sheet.dart';
import 'package:application/views/widgets/bottom_sheet/report_bottom_sheet.dart';
import 'package:application/views/widgets/dialog/confirm_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';

import 'community_modify_screen.dart';

mixin CommunityReaderMixin<T extends StatefulWidget> on State<T> {
  late final NavigatorState _rootNavi;
  late final AuthStateService _authState;
  late final PostBloc _getBloc;
  late Repository _repo;

  @override
  void initState() {
    L.instance.info(this, 'PostReaderMixin initState >>>');
    super.initState();
    _rootNavi = context.read<NavigationService>().rootKey.currentState!;
    _authState = context.read<AuthStateService>();
    _repo = context.read<Repository>();
    _getBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  void dispose() {
    print('PostReaderMixin dispose');
    super.dispose();
  }

  //조회수 증가
  void increaseViewCount(String postUid) {
    _repo.increaseField(
        FirebaseFirestore.instance.collection('posts').doc(postUid),
        field: 'viewCount',
        value: 1);
  }

  void overlayImage(AppPost post){
    _repo
        .downloadUrl(post.deleteImgPath!)
        .then((value) {
      CachedNetworkImageProvider ip =
      CachedNetworkImageProvider(
          value);
      ImageStream imageStream = ip
          .resolve(ImageConfiguration());
      imageStream.addListener(
          ImageStreamListener(
                  (imageInfo, s) {
                // l.info(this, imageInfo);
                Navigator.of(context).push(
                    PhotoOverlay(
                        post.imgDownload!, _repo,
                        imageInfo: imageInfo,
                        imageProvider: ip));
              }));
    });
  }

  void appBarOnAction(int i, AppPost post) {
    switch (i) {
      case 0:
        if (post != null) {
          // dynamic link
          makePostLink(post, isShortLink: true).then((value) {
            Share.share(value.toString());
          });
        }
        break;
      case 1:
        showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            builder: (context) {
              return PostMoreBottomSheet((j) {
                if (j == 0) {
                  // 수정
                  Navigator.of(context).pop();

                  _rootNavi.push((MaterialPageRoute(
                      builder: (context) => Provider?.value(
                            value: _rootNavi,
                            builder: (context, child) {
                              return MultiBlocProvider(
                                providers: [
                                  BlocProvider<ImageBloc>(
                                    create: (BuildContext context) =>
                                        ImageBloc(_repo),
                                  ),
                                  BlocProvider<VoteBloc>(
                                    create: (BuildContext context) =>
                                        VoteBloc(_repo),
                                  )
                                ],
                                child: CommunityModifyScreen(post),
                              );
                            },
                          ))));
                }
                if (j == 1) {
                  //
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmDialog(
                          title: Text('작성한 글을 삭제하시겠어요?',
                              style: AppTypos.noto_light.apply(
                                  fontSizeDelta: 4.0,
                                  color: Color(0xFF374553))),
                          left: Text('취소',
                              style: AppTypos.noto_light.apply(
                                  fontSizeDelta: 0.0,
                                  color: Color(0xFF646F7C))),
                          onPressedLeft: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          right: Text('삭제하기'),
                          onPressedRight: () async {
                            post.deleteImgPath!.length > 3
                                ? _getBloc.add(RemovePost(post.postUid!,
                                    deleteImgPath: post.deleteImgPath))
                                : _getBloc.add(RemovePost(post.postUid!));

                            _rootNavi.pop();
                            _rootNavi.pop();
                          },
                        );
                      });
                }
                if (j == 2) {
                  // 신고하기
                  showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return ReportBottomSheet(
                            _repo,
                            _authState.currentMe!.id,
                            post.postUid,
                            AppReportTargetTypeEnum.post);
                      });
                }
              }, post);
            });
        break;

      default:
    }
  }
}
