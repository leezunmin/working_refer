import 'package:application/blocs/bloc_interface.dart';
import 'package:application/blocs/blocs.dart';
import 'package:application/blocs/validate_mixin.dart';
import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/community/widgets/vote_chart_view.dart';
import 'package:application/views/views.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:rxdart/rxdart.dart';

class CommunityModifyScreen extends StatefulWidget {
  static const routeName = '/community/modify';
  final AppPost post;

  const CommunityModifyScreen(this.post, {Key? key}) : super(key: key);

  @override
  _CommunityModifyScreenState createState() => _CommunityModifyScreenState();
}

class _CommunityModifyScreenState extends State<CommunityModifyScreen>
    with AppStatefulViewMixin, ValidatorMixin, BlocInterface {
  final TextEditingController contentEditingController =
      TextEditingController();
  final TextEditingController titleEditingController = TextEditingController();
  late Repository _repo;
  late AuthStateService _authStateService;
  late final NavigatorState _rootNavi;
  AppPostHeaderEnum? _currentHeader = AppPostHeaderEnum.unknown;
  late AppPost post = widget.post;

  late final PostBloc _getBloc;
  late final ImageBloc _imgBloc;
  final imgProgress = BehaviorSubject<bool>();

  _CommunityModifyScreenState();

  @override
  void initState() {
    super.initState();
    _repo = context.read<Repository>();
    _authStateService = context.read<AuthStateService>();
    titleEditingController.text = post.title!;
    contentEditingController.text = post.text;

    _rootNavi = context.read<NavigationService>().rootKey.currentState!;
    _currentHeader = post.header;

    // 리팩토링
    _getBloc = BlocProvider.of<PostBloc>(context);
    _imgBloc = BlocProvider.of<ImageBloc>(context);

    initionalizeEditPost(post);

    _getBloc.postBlocTitleSub.sink.add(titleEditingController);
    _getBloc.postBlocContentSub.sink.add(contentEditingController);
    imgProgress.sink.add(false);
  }

  @override
  void dispose() {
    l.info(this, 'modify screen dispose >>');
    titleEditingController.dispose();
    contentEditingController.dispose();
    imgProgress.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: const Text("수정하기"),
          actions: [
            TextButton(
                onPressed: () async {
                  if (imgProgress.value) {
                    return showAlertWidget(title: "사진이 첨부중입니다.", cancle: false);
                  } else if (baseValidator(AppCommunityEnum.editValidate,
                      currentHeader: _currentHeader!)) {
                    // 사진상태에 따라 state가 다 다름
                    // 1.imgEmpty 2.ImagePickerSuccess 3.EditImg

                    handleImgPath(post);

                    _getBloc.add(makeBlocEvent(BlocEventEnum.editPost,
                        // _getBloc.add(_blocRepository.makeBlocEvent(BlocEventEnum.editPost,
                        currentHeader: _currentHeader,
                        postUid: post.postUid,
                        imgDownload: imgPathSub.valueOrNull,
                        deletePathForModify: deletePathSub.valueOrNull));

                    _imgBloc.add(InitialCamera());
                  }
                },
                child: Text("등록",
                    style: theme.textTheme.subtitle1!
                        .copyWith(color: AppColors.primary)))
          ],
        ),
        bottomNavigationBar: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 0,
                  thickness: 4,
                  color: AppColors.border,
                ),
                Container(
                  padding: AppEdgeInsets.horizontal16,
                  child: Row(
                    children: [
                      KeyboardAttachable(
                          child: IconButton(
                              icon: ImageIcon(Assets.images.icCameraBl24),
                              onPressed: () async {
                                await _onAddButton(context);
                              }))
                    ],
                  ),
                ),
              ],
            )),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            return SingleChildScrollView(
                child: SafeArea(
              child: Column(
                children: [
                  AppSpacers.height24,
                  BlocListener<PostBloc, PostState>(
                    listenWhen: (context, state) {
                      return state is Loaded;
                    },
                    listener: (context, state) {
                      if (state is Loaded) {
                        if (state.isValidated == true) {
                          print('게시글 수정 검증 성공>>');
                          _rootNavi.pop();
                          _rootNavi.pop();
                        }
                      }
                    },
                    child: Container(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: 200,
                        padding: AppEdgeInsets.horizontal16,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                useRootNavigator: true,
                                builder: (context) {
                                  return PostHeaderBottomSheet((header) {
                                    setState(() {
                                      _currentHeader = header;
                                    });
                                    _rootNavi.pop();
                                  });
                                });
                          },
                          child: Row(
                            children: [
                              Text(
                                _currentHeader!.description(),
                                style: theme.textTheme.subtitle2!
                                    .copyWith(color: AppColors.text50),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.text50,
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    padding: AppEdgeInsets.horizontal16,
                    child: TextField(
                      controller: titleEditingController,
                      style: theme.textTheme.subtitle1!
                          .copyWith(color: AppColors.text50),
                      decoration: InputDecoration(
                        hintStyle: theme.textTheme.subtitle1!
                            .copyWith(color: AppColors.text40),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 0, bottom: 11, top: 11, right: 15),
                        hintText: "제목을 입력해 주세요.",
                        counter: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                      ),
                      maxLength: 30,
                    ),
                  ),

                  Padding(
                    padding: AppEdgeInsets.horizontal16,
                    child: Divider(
                      height: 0,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                  ),
                  Container(
                    padding: AppEdgeInsets.horizontal16,
                    child: TextField(
                      maxLines: null,
                      maxLength: 500,
                      controller: contentEditingController,
                      decoration: InputDecoration(
                        hintStyle: theme.textTheme.bodyText2!
                            .copyWith(color: AppColors.text40),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 0, bottom: 11, top: 11, right: 15),
                        hintText: "내용을 입력해 주세요.",
                        counter: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                      ),
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: AppColors.text50),
                    ),
                  ),

                  AppSpacers.height24,

                  post.voteUid != null
                      ? VoteChartScreen(
                          post.voteUid!,
                          AppCommunityEnum.editVote,
                          postUid: post.postUid,
                        )
                      : const SizedBox(),

                  AppSpacers.height24,

                  // 첨부사진
                  // 원본 사진을 지울 수 있고, 새로운 사진으로 바꾸거나 삭제할 수 있다.

                  BlocBuilder<ImageBloc, ImageBlocState>(
                      builder: (BuildContext context, ImageBlocState state) {
                    if (state is EditImg) {
                      return Container(
                        width: boxConstraints.maxWidth - 30,
                        height: boxConstraints.maxHeight * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.circular8,
                            border: Border.all(
                                width: 1, color: AppColors.gray[030]!),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  state.imgDownload.toString()),
                            )),
                        child: Align(
                          alignment: const FractionalOffset(0.99, 0.01),
                          //사진 삭제 아이콘
                          child: IconButton(
                            icon: ImageIcon(Assets.images.icCancelSolidBl24,
                                color: AppColors.gray[60]),
                            onPressed: () {
                              //기존 있는 이미지를 삭제하는경우
                              print(' state.deleteImgPath >> ' +
                                  state.deleteImgPath.toString());
                              imgPathSub.sink.add("");

                              // 기존 있는 이미지를 삭제하는 경우도 맞고 + 여러번 삭제하며 반복하는 경우도 이는데,
                              // post deleteImage 가 항상 있는게아님. 같은화면에서 여러번 삭제하면...
                              // 삭제 경로를 listen 해야될거같다

                              _imgBloc.add(DeleteImage(
                                  // _imgBloc.add(CancleImage(
                                  deleteImgPath: post.deleteImgPath,
                                  postUid: post.postUid));
                            },
                          ),
                        ),
                      );
                    } else if (state is ImagePickerSuccess) {
                      l.info(this, 'BlocBuilder state is ImagePickerSuccess');
                      // 이미지 첨부가 새로 되면 첨부여부 초기화
                      imgProgress.sink.add(false);

                      return Container(
                        /*width: MediaQuery.of(context).size.width - 32,
                                    height: (MediaQuery.of(context).size.width - 32),*/
                        width: boxConstraints.maxWidth - 30,
                        height: boxConstraints.maxHeight - 300,
                        decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.circular8,
                            border: Border.all(
                                width: 1, color: AppColors.gray[030]!),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  state.imgDownload.toString()),
                            )),
                        child: Align(
                          alignment: const FractionalOffset(0.99, 0.01),
                          //사진 삭제 아이콘
                          child: IconButton(
                            icon: ImageIcon(Assets.images.icCancelSolidBl24,
                                color: AppColors.gray[60]),
                            onPressed: () {
                              // 업로드한걸 삭제하는경우
                              // _imgBloc.add(CancleImage(
                              _imgBloc.add(DeleteImage(
                                  deleteImgPath: state.deleteImgPath,
                                  postUid: post.postUid));
                            },
                          ),
                        ),
                      );
                    } else if (state is ImagePickerLoading) {
                      l.info(this, 'ImagePickerLoading');
                      return const Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ));
                    } else if (state is Uploading) {}
                    return Container();
                  }),
                ],
              ),
            ));
          },
        ));
  }

  _onAddButton(BuildContext context) {
    final _imgBloc = BlocProvider.of<ImageBloc>(context);

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
                _imgBloc.add(GetLoadImage(file));
              }
            },
            onPhotoPicker: () {},
          );
        });
  }
}
