import 'package:application/blocs/bloc_interface.dart';
import 'package:application/blocs/blocs.dart';
import 'package:application/blocs/validate_mixin.dart';
import 'package:application/generated/assets.gen.dart';
import 'package:application/models/app_post.dart';
import 'package:application/services/auth/auth_state_service.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class FloatingRefactor extends StatefulWidget {
  // FloatingRefactor(this._postBloc, this.post);
  const FloatingRefactor(this.post, {Key? key}) : super(key: key);

  final AppPost? post;

  @override
  FloatingRefactorState createState() => FloatingRefactorState();
}

class FloatingRefactorState extends State<FloatingRefactor>
    with AppStatefulViewMixin, ValidatorMixin, BlocInterface {
  FloatingRefactorState();

  late final AuthStateService _authState;
  late AppPost? post = widget.post;
  late final CommentBloc _commenBloc;
  late final TagCommentBloc _tagCommentBloc;
  late final CommentImageBloc _commentImgBloc;
  late final Me me;

  TextStyle? contentStyle;
  TextStyle? infoStyle;
  TextStyle? titleStyle;

  final imgProgress = BehaviorSubject<bool>.seeded(false);

  @override
  void initState() {
    super.initState();

    _authState = context.read<AuthStateService>();
    me = _authState.currentMe!;
    _commenBloc = BlocProvider.of<CommentBloc>(context);
    _tagCommentBloc = BlocProvider.of<TagCommentBloc>(context);
    _commentImgBloc = BlocProvider.of<CommentImageBloc>(context);
  }

  @override
  void dispose() {
    imgProgress.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    contentStyle = theme.textTheme.bodyText2!
        .copyWith(color: AppColors.text50)
        .apply(fontSizeFactor: 1.0);
    infoStyle = theme.textTheme.bodyText2!
        .copyWith(color: AppColors.text50)
        .apply(fontSizeFactor: 1.0);
    titleStyle = theme.textTheme.subtitle2!.copyWith(color: AppColors.text50);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Container(
          width: boxConstraints.maxWidth,
          padding: const EdgeInsets.only(bottom: 0.0),
          color: Colors.white,
          child: SizedBox(
              // height: 115,
              child: Column(
            children: [
              /*Row(
                children: const [
                  AppSpacers.width70,
                ],
              ),*/
              Container(
                  width: boxConstraints.maxWidth,
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      // POINT
                      color: AppColors.border,
                      width: 1,
                    ),
                  )),
                  // borderRadius: AppBorderRadius.horizontalLeft8),
                  padding:
                      AppEdgeInsets.horizontal16.add(AppEdgeInsets.vertical8),
                  child: Column(
                    children: [
                      BlocConsumer<TagCommentBloc, TagCommentState>(
                          listener: (context, state) {},
                          /* buildWhen: (previous, current) {
                          // return true/false to determine whether or not
                          // to rebuild the widget with state
                          },*/
                          builder: (context, state) {
                            if (state is TaggingState ||
                                state is ReCommentTaggingState) {
                              tagToRecomment();
                              return SizedBox(
                                // width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: boxConstraints.maxWidth * 0.7,
                                        child: state is TaggingState
                                            ? Text(
                                                '@ ' +
                                                    nickTagged.stream.value +
                                                    '에게 답글',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: infoStyle!.apply(
                                                    fontSizeDelta: -1,
                                                    color: const Color(
                                                        0xFF646F7C)),
                                              )
                                            : Text(
                                                '@ ' +
                                                    nickTagged.stream.value +
                                                    '에게 답글',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: infoStyle!.apply(
                                                    fontSizeDelta: -1,
                                                    color: const Color(
                                                        0xFF6495ED)),
                                              )),
                                    SizedBox(
                                        width: boxConstraints.maxWidth * 0.18,
                                        child: TextButton(
                                          child: Text('취소',
                                              style: infoStyle!.apply(
                                                  fontSizeDelta: -1,
                                                  color:
                                                      const Color(0xFFC5C8CE)),
                                              textAlign: TextAlign.right),
                                          onPressed: () {
                                            state is TaggingState
                                                ? _tagCommentBloc
                                                    .add(ClearTag())
                                                : _tagCommentBloc
                                                    .add(ClearRecommentTag());
                                          },
                                        )),
                                  ],
                                ),
                              );
                            } else if (state is ClearTagState) {
                              return Container();
                            } else {
                              return Container();
                            }
                          }),
                      Row(
                        children: [
                          BlocBuilder<TagCommentBloc, TagCommentState>(
                              /* buildWhen: (previous, current) => ,*/
                              builder: (BuildContext context,
                                  TagCommentState state) {
                            print('state 빌드 ' + state.runtimeType.toString());
                            if (state is InitialTagCommentState ||
                                state is ClearTagState ||
                                state is ClearReCommentTagState) {
                              return Container(
                                  height: 54,
                                  padding: const EdgeInsets.only(
                                      left: 0, bottom: 0, right: 10),
                                  child: InkWell(
                                    child: ImageIcon(
                                      Assets.images.icCameraGray24,
                                      color: AppColors.text50,
                                      size: 30.0,
                                    ),
                                    onTap: () async {
                                      await _onAddButton(context);
                                    },
                                  ));
                            }
                            return Container();
                          }),
                          Expanded(
                              child: Container(
                            width: boxConstraints.maxWidth,
                            padding: AppEdgeInsets.all8,
                            height: 54,
                            decoration: BoxDecoration(
                                color: AppColors.gray[20],
                                border: Border.all(
                                    width: 1, color: AppColors.border),
                                borderRadius: AppBorderRadius.horizontalLeft8),
                            child:

                                // 원문
                                TextField(
                              maxLength: 500,
                              maxLines: null,
                              controller:
                                  _commenBloc.commentTxtSub.stream.value,
                              style: theme.textTheme.bodyText2!.copyWith(),
                              decoration: InputDecoration(
                                hintText: "댓글을 입력해 주세요.",
                                // hintStyle: theme.textTheme.subtitle1!.apply(color: AppColors.text40, fontSizeDelta: -1),
                                hintStyle: AppTypos.noto_regular.apply(
                                    fontSizeDelta: -1,
                                    color: const Color(0xFFC5C8CE)),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,

                                // contentPadding: EdgeInsets.only(left: 10, bottom: 3),
                                contentPadding:
                                    const EdgeInsets.only(left: 10, bottom: 8),

                                // contentPadding: EdgeInsets.all(7),
                                counter: const SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                              ),
                            ),
                          )),

                          /*StreamBuilder<bool>(
                            stream: imgProgress.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data!) {
                                return Text('로딩중');
                              } else {
                                return Container();
                              }
                            },
                          ),*/

                          BlocBuilder<CommentImageBloc, CommentImageState>(
                              buildWhen: (previous, current) =>
                                  (current is ImgLoadSucced ||
                                      current is CommentImgEmpty),
                              builder: (BuildContext context,
                                  CommentImageState state) {
                                if (state is CommentImgEmpty) {
                                  return addCommentButton(boxConstraints);
                                } else if (state is ImgLoadSucced) {
                                  print('값 ' + imgProgress.value.toString());

                                  // 이미지 첨부가 새로 되면 첨부여부 초기화
                                  imgProgress.sink.add(false);
                                  return Container(
                                      height: 54,
                                      width: boxConstraints.maxWidth * 0.32,
                                      child: Stack(children: [
                                        Positioned(
                                            child: addCommentButton(
                                                boxConstraints)),
                                        Positioned(
                                            left: 70,
                                            bottom: 0,
                                            top: 0,
                                            child: Container(
                                                height: 54,
                                                width: boxConstraints.maxWidth *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        AppBorderRadius
                                                            .circular8,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          CachedNetworkImageProvider(
                                                              state.imgDownload
                                                                  .toString()),
                                                    )),
                                                child: Align(
                                                  alignment: FractionalOffset(
                                                      1.8, 0.01),
                                                  //사진 삭제 아이콘
                                                  child: IconButton(
                                                    icon: ImageIcon(
                                                        Assets.images
                                                            .icCancelSolidBl24,
                                                        color:
                                                            AppColors.gray[60]),
                                                    onPressed: () {
                                                      _commentImgBloc.add(
                                                          RemoveCommentImg(
                                                              deleteImgPath: state
                                                                  .deleteImgPath));
                                                    },
                                                  ),
                                                ))),
                                      ]));
                                }
                                return Container();
                              })
                        ],
                      ),
                    ],
                  ))
            ],
          )));
    });
  }

  _onAddButton(BuildContext context) {
    final _commentImgBloc = BlocProvider.of<CommentImageBloc>(context);

    showModalBottomSheet(
        backgroundColor: AppColors.transparent,
        context: context,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return PhotoSelectorBottomSheet(
            onPick: (file) async {
              l.info(this, 'file >>> ' + file.toString());
              imgProgress.sink.add(true);
              if (file != null) {
                _commentImgBloc.add(PickImg(file));
              }
            },
            onPhotoPicker: () {},
          );
        });
  }

  Widget addCommentButton(
    BoxConstraints boxConstraints,
  ) {
    final _commentImgBloc = BlocProvider.of<CommentImageBloc>(context);

    return Container(
      height: 54,
      width: boxConstraints.maxWidth * 0.15,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.border),
          borderRadius: AppBorderRadius.horizontalRight8),
      // padding: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(left: 15, top: 18, right: 15),
      child: InkWell(
        child: Text(
          "등록",
          style: AppTypos.noto_regular
              .apply(fontSizeDelta: -1, color: const Color(0xFFC5C8CE)),
        ),
        onTap: () async {
          tagToAdd();
          final state = _tagCommentBloc.state;

          if (imgProgress.value) {
            return showAlertWidget(title: "사진이 첨부중입니다.", cancle: false);
          } else if (validateCommentTxt(
                  _commenBloc.commentTxtSub.stream.value) ==
              true) {
            _commenBloc.add(makeBlocEvent(BlocEventEnum.addComment, post: post
                // imgUrl: imgUrl, deletePath: deletePath
                ));

            _commenBloc.commentTxtSub.stream.value.clear();
            _tagCommentBloc.add(ClearTag());
            // 코멘트 이미지 초기화 필요
            _commentImgBloc.add(InitCommentImg());
          }
        },
      ),
    );
  }
}
