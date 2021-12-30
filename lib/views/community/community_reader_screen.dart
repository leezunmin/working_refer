import 'package:application/blocs/blocs.dart';
import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/utils/utils.dart';
import 'package:application/views/community/community_reader_mixin.dart';
import 'package:application/views/community/widgets/floating_button_refactor.dart';
import 'package:application/views/community/widgets/vote_chart_view.dart';
import 'package:application/views/views.dart';
import 'package:application/views/widgets/views.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'comment_screen.dart';

class CommunityReaderScreen extends StatefulWidget {
  static const routeName = '/community/reader';
  final AppPost post;

  const CommunityReaderScreen(this.post);

  @override
  CommunityReaderScreenState createState() => CommunityReaderScreenState(post);
}

class CommunityReaderScreenState extends State<CommunityReaderScreen>
    with AppStatefulViewMixin, MembershipMixin, CommunityReaderMixin {
  CommunityReaderScreenState(this.post);

  final contentEditingController = TextEditingController();
  late final AuthStateService _authState;
  late final NavigatorState _rootNavi;

  late AppPost post;
  late final AppUserProfile? userProfile;
  TextStyle? contentStyle;
  TextStyle? infoStyle;
  TextStyle? titleStyle;
  late final PostBloc _getBloc;
  late final CommentBloc _commenBloc;
  late final TagCommentBloc _tagCommentBloc;
  late final LikePostBloc _likeStateBloc;

  @override
  void initState() {
    super.initState();
    // print('Community reader screen initState >>> ');

    _authState = context.read<AuthStateService>();
    _rootNavi = context.read<NavigationService>().rootKey.currentState!;
    userProfile = _authState.currentMe?.profile;
    post = post;
    _getBloc = BlocProvider.of<PostBloc>(context);
    final _imgBloc = BlocProvider.of<ImageBloc>(context);

    post.imgDownload!.length > 6
        ? _imgBloc.add(ReadImg(imgPath: post.imgDownload))
        : _imgBloc.add(InitialCamera());

    // 리팩토링
    // 댓글 입력 텍스트를 관찰하기 위한 commentTxtSub
    _commenBloc = BlocProvider.of<CommentBloc>(context);
    _commenBloc.commentTxtSub.sink.add(contentEditingController);
    _tagCommentBloc = BlocProvider.of<TagCommentBloc>(context);
    _likeStateBloc = BlocProvider.of<LikePostBloc>(context);
    _likeStateBloc.add(GetPostLike(post.postUid!, userProfile!.id));

    increaseViewCount(post.postUid!);
  }

  @override
  void dispose() {
    contentEditingController.dispose();
    _tagCommentBloc.add(ClearTag());
    _getBloc.add(InitialOnce());
    super.dispose();
  }

  // 안쓸예정, 원본
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    titleStyle = theme.textTheme.bodyText1!
        .apply(fontSizeFactor: 1.2, color: AppColors.text60);
    contentStyle = theme.textTheme.bodyText2!
        .apply(fontSizeFactor: 1.0, color: AppColors.text50);
    infoStyle = theme.textTheme.bodyText2!
        .apply(fontSizeFactor: 0.9, color: AppColors.text50);

    return Scaffold(
        // key: readerKey,
        // 키보드 올라오려면 true, 하지만 공백생김
        // resizeToAvoidBottomInset: true,
        resizeToAvoidBottomInset: false,
        appBar: appPageAppBar(context,
            icon1: ImageIcon(Assets.images.icShare24, color: AppColors.text60),
            icon2: ImageIcon(Assets.images.icMore24, color: AppColors.text60),
            onAction: (i) {
          appBarOnAction(i, post);
        }),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.zero,
            child: KeyboardAttachable(child: FloatingRefactor(post))),
        body: GestureDetector(onTap: () {
          FocusScope.of(context).unfocus();
        }, child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            return SingleChildScrollView(
                child: post.deleteFlag == "Y"
                    ? Container(
                        child: Center(
                            child: Column(children: [
                        AppSpacers.height24,
                        Text('원문글이 삭제되었습니다.', style: titleStyle),
                      ])))
                    : SafeArea(
                        child: SizedBox(
                        width: boxConstraints.maxWidth,
                        child: Column(
                          children: [
                            AppSpacers.height24,
                            Container(
                              padding: AppEdgeInsets.horizontal16,
                              child: Row(
                                children: [
                                  Text(
                                    post.header!.description(),
                                    style: infoStyle,
                                  )
                                ],
                              ),
                            ),
                            AppSpacers.height8,
                            Container(
                                padding: AppEdgeInsets.horizontal16,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    post.title!,
                                    style: titleStyle,
                                  ),
                                )),
                            AppSpacers.height8,
                            _info(),
                            Padding(
                              padding: AppEdgeInsets.horizontal16,
                              child: Divider(
                                height: 32,
                                thickness: 1,
                              ),
                            ),
                            AppSpacers.height8,
                            Container(
                                padding: AppEdgeInsets.horizontal16,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    post.text,
                                    maxLines: null,
                                    textAlign: TextAlign.justify,
                                    style: contentStyle,
                                  ),
                                )),
                            AppSpacers.height24,

                            post.voteUid != null
                                ? VoteChartScreen(
                                    post.voteUid!, AppCommunityEnum.readVote,
                                    postUid: post.postUid)
                                : SizedBox(),

                            AppSpacers.height24,

                            // 첨부사진
                            BlocBuilder<ImageBloc, ImageBlocState>(
                                // buildWhen: (previous, current) => previous != current && current is LoadedImg,
                                // buildWhen: (previous, current) =>  (current != ImagePickerEmpty),

                                buildWhen: (previous, current) =>
                                    current is LoadedImg,
                                builder: (BuildContext context,
                                    ImageBlocState state) {
                                  print(
                                      'ImageBloc BlocBuilder ImageBlocState >> ' +
                                          state.toString());

                                  if (state is LoadedImg) {
                                    return InkWell(
                                        onTap: () {
                                          overlayImage(post);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32,
                                          height: (MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        post.imgDownload!),
                                                // image: CachedNetworkImageProvider(post.deleteImgPath),
                                              ),
                                              // border: Border.all(width: 1, color: AppColors.primary),
                                              borderRadius:
                                                  AppBorderRadius.circular8),
                                        ));
                                  }
                                  return Container();
                                }),

                            AppSpacers.height24,
                            Divider(
                              thickness: 1,
                              height: 1,
                            ),

                            InkWell(
                              onTap: () {},
                              child: Container(
                                // color: Colors.deepOrange,
                                padding: AppEdgeInsets.vertical16,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocBuilder<LikePostBloc, PostLikeState>(
                                        // buildWhen: (previous, current) => previous != current && current is LoadedComment,
                                        builder: (BuildContext context,
                                            PostLikeState state) {
                                      l.info(
                                          this,
                                          'BlocBuilder PostLikeState state >> ' +
                                              state.toString());

                                      if (state is InitialLikePostState) {
                                        return Container();
                                      } else if (state is LikeFalse) {
                                        return IconButton(
                                            icon: ImageIcon(
                                                Assets.images.icHeart24,
                                                color: AppColors.gray),
                                            color: AppColors.text60,
                                            iconSize: AppTypoTokens.k20,
                                            onPressed: () {
                                              _likeStateBloc.add(DoPostLike(
                                                  post.postUid!,
                                                  userProfile!.id));
                                            });
                                      } else if (state is LikeTrue) {
                                        return IconButton(
                                            icon: ImageIcon(
                                                Assets
                                                    .images.icHeartSolidGreen24,
                                                color: AppColors.primary),
                                            color: AppColors.text60,
                                            iconSize: AppTypoTokens.k20,
                                            onPressed: () {
                                              _likeStateBloc.add(ClearPostLike(
                                                  post.postUid!,
                                                  userProfile!.id));
                                            });
                                      }
                                      return SizedBox();
                                    }),

                                    // AppSpacers.width16,
                                    AppSpacers.width4,
                                    Text(
                                      "좋아요",
                                      style: contentStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              color: AppColors.border,
                              height: 6,
                            ),
                            AppSpacers.height16,
                            CommentScreen(
                                post.postUid, repo, _rootNavi, userProfile),
                          ],
                        ),
                      )));
          },
        )));
  }

  Widget _info() {
    return Container(
      padding: AppEdgeInsets.horizontal16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration:
                    BoxDecoration(borderRadius: AppBorderRadius.circular16),
                child: FutureBuilder<String?>(
                  future: repo.userProfilePhotoUrl(post.ownerId),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      //탈퇴 회원 이미지
                      return InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("탈퇴한 회원입니다."),
                            ));
                          },
                          child: CustomPortrait(
                            "assets/images/outed_person.png",
                          ));
                    }
                    if (snapshot.hasData && snapshot.data != null) {
                      return InkWell(
                        onTap: () {
                          // 원
                          _tapMember(userProfile, post.nickName);
                        },
                        child: Portrait(
                          snapshot.data,
                          //  onTap : _tapMember
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              AppSpacers.width8,
              SizedBox(
                width: 80,
                child: Text(
                  post.nickName,
                  style: infoStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppSpacers.width8,
              ImageIcon(
                Assets.images.icView18,
                color: AppColors.text50,
              ),
              AppSpacers.width8,
              Text(
                "${post.viewCount}",
                style: infoStyle,
              ),
            ],
          ),
          Text(
            formatyyMMddHHmm(post.createdAt!),
            style: infoStyle,
          ),
        ],
      ),
    );
  }

  // void _tapMember(AppUserProfile? user, String postOwnerId) async {
  //   final push = () => _rootNavi.pushNamed(ProfileScreen.routeName,
  //       arguments: ProfileScreenArgs(
  //         post.ownerId,
  //         likeAble: true,
  //       ));

  //   if (post.ownerId == null) return;

  //   // superApply 는 반짝만남만 적용됨
  //   // 에브리띵이라는 멤버십일때만 프로필 확인할수있음
  //   // 댓글작성자랑 둘다
  //   // 본인거도 볼수있음

  //   if (post.ownerId == user!.id) {
  //     // 내글이면
  //     push();
  //     return;
  //   }

  //   final result = await checkShowCommunityProfile(user.id);

  //   if (!result) {
  //     showBuyStarDialog(name: postOwnerId).then((ok) async {
  //       if (ok) {
  //         final result = await repo.createShown(user.id);
  //         if (result) {
  //           push();
  //         } else {
  //           pushStarStore();
  //         }
  //       }
  //     });
  //     return;
  //   }
  //   push();
  // }
}
