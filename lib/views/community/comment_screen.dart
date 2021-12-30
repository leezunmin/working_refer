import 'package:application/blocs/blocs.dart';
import 'package:application/blocs/tag_comment/export_tag_bloc.dart';
import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/utils/utils.dart';
import 'package:application/views/views.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreen extends StatefulWidget {
  String? postUid;
  Repository? repo;
  final NavigatorState _rootNavi;
  AppUserProfile? userProfile;

  CommentScreen(this.postUid, this.repo, this._rootNavi, this.userProfile,
      {Key? key})
      : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen>
    with MembershipMixin, LogMixin {
  late final Repository _repo;
  late final AuthStateService _authState;
  late final NavigatorState _rootNavi;

  TextStyle? contentStyle;
  TextStyle? infoStyle;
  TextStyle? titleStyle;
  late final String? _postUid = widget.postUid;
  late AppUserProfile? userProfile = widget.userProfile;
  late final CommentBloc _commenBloc;
  late final TagCommentBloc _tagCommentBloc;

  _CommentScreenState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _rootNavi = context.read<NavigationService>().rootKey.currentState!;
    _repo = context.read<Repository>();
    _authState = context.read<AuthStateService>();

    l.info(this, 'CommentScreen initState >> ');
    // 리팩토링
    _commenBloc = BlocProvider.of<CommentBloc>(context);
    _commenBloc.add(FetchComment(postUid: _postUid, ownerId: userProfile!.id));

    _tagCommentBloc = BlocProvider.of<TagCommentBloc>(context);
    // print('코멘트 스크린에서의 _tagCommentBloc 해쉬코드 ' + _tagCommentBloc.hashCode.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print('didChangeDependencies >>> ');
  }

/*  @override
  void didUpdateWidget(Widget oldWidget) {
    // super.didUpdateWidget(oldwidgettt!);
    print('didChangeDependencies >>> ');
  }*/

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    contentStyle = theme.textTheme.bodyText2!
        .copyWith(color: AppColors.text50)
        .apply(fontSizeFactor: 1.0);
    infoStyle = theme.textTheme.bodyText2!
        .copyWith(color: AppColors.text50)
        .apply(fontSizeFactor: 0.9);
    titleStyle = theme.textTheme.subtitle2!.copyWith(color: AppColors.text50);

    print('_CommentScreenState >>  Widget build >>');
    // 제스처 디텍터를 안써도 블록빌더가 리빌드된다.

    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
      print('코멘트 스크린 GestureDetector 온탭 >>> ');
    }, child:
        // 원본
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Container(
        width: boxConstraints.maxWidth,
        padding: AppEdgeInsets.horizontal16,
        decoration: BoxDecoration(
            // color: AppColors.gray[20],
            // border: Border.all(width: 1, color: AppColors.border),
            borderRadius: AppBorderRadius.horizontalLeft8),
        child: Column(children: [
          BlocBuilder<CommentBloc, CommentState>(
              // 원
              buildWhen: (previous, current) =>
                  previous != current && current is LoadedComment,

              /*buildWhen: (previous, current) {
                  print('buildWhen ?? ');
                   return current is LoadedComment;
                   // return previous != current!;
                  },*/
              builder: (BuildContext context, CommentState state) {
                // l.info(this, 'BlocBuilder CommentBloc state >> ' + state.toString());
                l.info(
                    this,
                    'BlocBuilder CommentBloc state >> ' +
                        state.runtimeType.toString());

                if (state is CommentEmpty) {
                  return Container();
                } else if (state is LoadedComment) {
                  if (state.commentList.isEmpty) {
                    // return Container();
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('댓글', style: infoStyle),
                            AppSpacers.width8,
                            // Text(state.replyCount.toString(),
                            Text('${state.replyCount}',
                                style:
                                    infoStyle!.apply(color: AppColors.text40)),
                          ],
                        ),
                        AppSpacers.height16,
                        Container()
                      ],
                    );
                  }
                  ListView listView = ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.commentList.length,
                      itemBuilder: (context, index) => replyWidget(
                          state.commentList.elementAt(index), context));

                  // return listView;
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text('댓글', style: infoStyle),
                          AppSpacers.width8,
                          // Text(state.replyCount.toString(),
                          Text('${state.replyCount}',
                              style: infoStyle!.apply(color: AppColors.text40)),
                        ],
                      ),
                      AppSpacers.height16,
                      listView
                    ],
                  );
                }
                return const SizedBox();
              }),
        ]),
      );
    }));
  }

  Widget replyWidget(AppReply? reply, BuildContext Context) {
    print('Widget replyWidget');
    print('Widget replyWidget >>> reply uid ' + reply!.replyUid.toString());

    return reply.deleteFlag == "N"
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
            return Container(
                width: boxConstraints.maxWidth,
                color: reply.ownerId == _authState.currentMe!.id
                    ? AppColors.bg
                    : Colors.white,
                // color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              // padding: AppEdgeInsets.horizontal16,

                              width: 32,
                              height: 32,

                              /* width: boxConstraints.maxWidth,
                                height: boxConstraints.maxHeight,*/

                              decoration: BoxDecoration(
                                  borderRadius: AppBorderRadius.circular16),
                              child: FutureBuilder<String?>(
                                future:
                                    _repo.userProfilePhotoUrl(reply.ownerId),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    // return showProgres();
                                    //탈퇴 회원 이미지
                                    return InkWell(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("탈퇴한 회원입니다."),
                                          ));
                                        },
                                        child: const CustomPortrait(
                                          "assets/images/outed_person.png",
                                        ));
                                  }
                                  /*if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    print('스냅샷 커넥션 웨이팅');
                                    return showProgres();
                                  } */

                                  else if (snapshot.data == null) {
                                    //탈퇴 회원 이미지
                                    return InkWell(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("탈퇴한 회원입니다."),
                                          ));
                                        },
                                        child: const CustomPortrait(
                                          "assets/images/outed_person.png",
                                        ));
                                  } else if (snapshot.hasData &&
                                      snapshot.data != null) {
                                    return InkWell(
                                        onTap: () {
                                          _tapMember(userProfile, reply: reply);
                                        },
                                        child: Portrait(snapshot.data));
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                            AppSpacers.width8,
                            SizedBox(
                              width: 130,
                              child: Text(
                                reply.nickName!,
                                // style: AppTypos.noto_Medium.apply(color: Color(0xFF646F7C)),
                                style: infoStyle!
                                    .apply(color: const Color(0xFF646F7C)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        AppSpacers.width8,
                        Row(
                          children: [
                            Text(
                              // formatyyMMdd(reply.createdAt),
                              formatyyMMdd(reply.createDate!),
                              // list.date.toString(),
                              style: infoStyle!.apply(color: AppColors.text40),
                            ),
                            AppSpacers.width8,
                            // ImageIcon(Assets.images.more_18, color: AppColors.text50),
                            viewModalBottom(collection: reply, type: 'reply'),
                            AppSpacers.width8,
                          ],
                        )
                      ],
                    ),
                    AppSpacers.height8,
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding:
                              AppEdgeInsets.left32.add(AppEdgeInsets.left8),
                          child: Text(
                            reply.content.toString(),
                            // style: AppTypos.noto_light.apply(color: Color(0xFF646F7C))
                            style: infoStyle!
                                .apply(color: const Color(0xFF646F7C)),
                          ),
                        )),

                    AppSpacers.height8,

                    (reply.imgDownload != null && reply.imgDownload!.length > 6)
                        ? Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                padding: AppEdgeInsets.left32
                                    .add(AppEdgeInsets.left8),
                                child:
                                    // commentImg(reply: reply)
                                    Container(
                                  height: 100,
                                  width: boxConstraints.maxWidth * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: AppBorderRadius.circular8,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            reply.imgDownload.toString()),
                                      )),
                                )))
                        : SizedBox(),

                    AppSpacers.height8,

                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding:
                                AppEdgeInsets.left32.add(AppEdgeInsets.left8),
                            child: Column(
                              children: [
                                InkWell(
                                  child: Text('답글',
                                      style: infoStyle!.apply(
                                          fontSizeDelta: 2,
                                          color: AppColors.text40)),
                                  onTap: () {
                                    print('Comment Screen 답글 클릭 >>');

                                    _tagCommentBloc.add(TargetTag(
                                        reply.nickName!, reply.replyUid!));
                                  },
                                )
                              ],
                            ))),

                    // if (!widget.isReRe) AppSpacers.height8,

                    AppSpacers.height14,

                    //대댓글
                    // Divider(),

                    // 대댓글, 스트림빌더
                    // 이쪽 스트림빌더가 리빌드 현상

                    reply.replyUid != null && reply.replyUid!.isNotEmpty
                        ? StreamBuilder<List<AppReReply?>>(
                            stream: _repo.getReReplyStream(reply.replyUid),
                            builder: (context, rereSnap) {
                              if (!rereSnap.hasData) {
                                return Container();
                              } else if (rereSnap.connectionState ==
                                  ConnectionState.active) {
                                List<AppReReply?>? rereList = rereSnap.data;

                                if (rereList!.isNotEmpty) {
                                  ListView listView = ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: rereList.length,
                                      itemBuilder: (context, index) =>
                                          rereWidget(
                                              rereList[index]!, context));
                                  return listView;
                                } else {
                                  return Container();
                                }
                              }
                              return Container();
                            },
                          )
                        : const SizedBox(),

                    // Divider(),
                    // AppSpacers.height8,
                  ],
                ));
          })
        : replyDeleted(reply, context);
  }

  Widget replyDeleted(AppReply reply, BuildContext Context) {
    print('위젯 replyDeleted >> ');
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Container(
          width: boxConstraints.maxWidth,
          color: Colors.white,
          child: Column(
            children: [
              AppSpacers.height24,
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    // padding: AppEdgeInsets.left32.add(AppEdgeInsets.left8),
                    constraints:
                        const BoxConstraints(minHeight: 30, maxHeight: 100),
                    child: Text('삭제된 댓글이에요.',
                        style: AppTypos.noto_regular.apply(
                            // fontSizeDelta: 4.0,
                            color: const Color(0xFFC5C8CE))),
                  )),

              AppSpacers.height14,

              StreamBuilder<List<AppReReply?>>(
                stream: _repo.getReReplyStream(reply.replyUid),
                builder: (context, rereSnap) {
                  //원 댓글 작성할때 오류화면 막아줌..
                  if (rereSnap.connectionState == ConnectionState.waiting) {
                    return showProgres();
                  }
                  if (!rereSnap.hasData) {
                    return showProgres();
                  }
                  List<AppReReply?>? rereList = rereSnap.data;

                  ListView listView = ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: rereList!.length,
                      itemBuilder: (context, index) =>
                          rereWidget(rereList[index]!, context));
                  return listView;
                },
              ),

              // Divider(),
              AppSpacers.height8,
            ],
          ));
    });
  }

  //대댓글 위젯
  Widget rereWidget(AppReReply? rereply, BuildContext Context) {
    // print('빌드 위젯 rereWidget >> ');
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Container(
          color: rereply!.ownerId == _authState.currentMe!.id
              ? AppColors.bg
              : Colors.white,
          padding: AppEdgeInsets.horizontal16.add(AppEdgeInsets.left32),
          child: Column(
            children: [
              rereply.deleteFlag == "Y"
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: AppBorderRadius.circular16),
                                child: FutureBuilder<String?>(
                                  future: _repo
                                      .userProfilePhotoUrl(rereply.ownerId),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      //탈퇴 회원 이미지
                                      return InkWell(
                                          onTap: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text("탈퇴한 회원입니다."),
                                            ));
                                          },
                                          child: const CustomPortrait(
                                            "assets/images/outed_person.png",
                                          ));
                                    }

                                    if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      return InkWell(
                                          onTap: () {
                                            _tapMember(userProfile,
                                                rereply: rereply);
                                          },
                                          child: Portrait(
                                            snapshot.data,
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                              AppSpacers.width8,
                              Flexible(
                                  child: InkWell(
                                      onTap: () {
                                        _tagCommentBloc.add(RecommentTag(
                                            rereply.nickName!,
                                            rereply.replyUid!,
                                            rereply.nickName!));
                                      },
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        strutStyle:
                                            const StrutStyle(fontSize: 14.0),
                                        text: TextSpan(
                                            // style: AppTypos.noto_Medium.apply(color: Color(0xFF6495ED)),
                                            style: infoStyle!.apply(
                                                color: const Color(0xFF6495ED)),
                                            text: '@${rereply.nickName!}'),
                                      ))),
                            ],
                          ),
                        ),
                        AppSpacers.width8,
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                              formatyyMMdd(rereply.createDate!),
                              // '날짜',
                              style: infoStyle!.apply(color: AppColors.text40),
                            ),
                            AppSpacers.width8,

                            // ImageIcon(Assets.images.more_18, color: AppColors.text50),
                            viewModalBottom(
                                collection: rereply, type: 'rereply'),

                            AppSpacers.width8,
                          ],
                        ))
                      ],
                    ),
              AppSpacers.height8,
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      padding: AppEdgeInsets.left32.add(AppEdgeInsets.left8),
                      constraints:
                          const BoxConstraints(minHeight: 30, maxHeight: 100),
                      child: rereply.deleteFlag == "Y"
                          ? Text('삭제된 대댓글이에요.',
                              style: AppTypos.noto_regular
                                  .apply(color: const Color(0xFFC5C8CE)))
                          :
                          /*Row(children: [
                              rereply.reCommentTarget != null ?
                              Text('@${rereply.reCommentTarget}' + '  ${rereply.content}', style: contentStyle)
                              : Text('${rereply.content}', style: contentStyle),

                            ])*/

                          Container(
                              child: rereply.reCommentTarget != null
                                  ? Text(
                                      '@${rereply.reCommentTarget}'
                                      '  ${rereply.content}',
                                      style: contentStyle)
                                  : Text('${rereply.content}',
                                      style: contentStyle),
                            ))),
              // 구분선 지움
              // Divider(),
              AppSpacers.height8,
            ],
          ));
    });
  }

  void _tapMember(AppUserProfile? user,
      {AppReply? reply, AppReReply? rereply}) async {
    final push = () => _rootNavi.pushNamed(ProfileScreen.routeName,
        arguments: ProfileScreenArgs(
          reply != null ? reply.ownerId! : rereply!.ownerId!,
          likeAble: true,
        ));

    // if (reply?.ownerId == null ) return;
    // if (rereply?.ownerId == null ) return;

    if (reply?.ownerId == user!.id || rereply?.ownerId == user.id) {
      push();
      return;
    }
    final result = await checkShowCommunityProfile(user.id);
    if (!result) {
      showBuyStarDialog(name: user.nickName).then((ok) async {
        if (ok) {
          final result = await repo.createShown(user.id);
          if (result) {
            push();
          } else {
            pushStarStore();
          }
        }
      });
      return;
    }
    push();
  }

  // 더보기 버튼 모달
  Widget viewModalBottom({dynamic collection, String? type}) {
    return IconButton(
      icon: ImageIcon(Assets.images.icMore18, color: AppColors.text50),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            builder: (context) {
              return PostMoreBottomSheet((j) {
                /* if (j == 0) {
                  l.info(this, '리플 수정');*/
                if (j == 1) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmDialog(
                          title: Text('작성한 댓글을 삭제하시겠어요?',
                              style: AppTypos.noto_light.apply(
                                  fontSizeDelta: 4.0,
                                  color: const Color(0xFF374553))),
                          left: Text('취소',
                              style: AppTypos.noto_light.apply(
                                  fontSizeDelta: 0.0,
                                  color: const Color(0xFF646F7C))),
                          onPressedLeft: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          right: const Text('삭제하기'),
                          onPressedRight: () async {
                            Navigator.of(context).pop();

                            type == "reply"
                                ? _commenBloc.add(RemoveReply(
                                    replyUid: collection.replyUid,
                                    postUid: collection.postUid))
                                : _commenBloc.add(RemoveReply(
                                    replyUid: collection.replyUid,
                                    rereplyUid: collection.rereplyUid,
                                    postUid: collection.postUid));
                          },
                        );
                      });
                }

                if (j == 2) {
                  l.info(this, '댓글 신고하기');
                  showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return ReportBottomSheet(
                            // return PostMoreBottomSheet(
                            _repo,
                            _authState.currentMe!.id,
                            collection.rereplyUid,
                            AppReportTargetTypeEnum.reply);
                      });
                }
              }, collection);
            });
      },
    );
  }

  Widget showProgres() {
    return const Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        AppColors.primary,
      ),
    ));
  }
}
