import 'package:application/apis/firestore/firestore_api.dart';
import 'package:application/blocs/blocs.dart';
import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/utils/utils.dart';
import 'package:application/views/views.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfileCommunityScreen extends StatefulWidget {
  static const routeName = '/mypage/community';
  final bool wantKeepAlive;

  const ProfileCommunityScreen({this.wantKeepAlive = true, Key? key})
      : super(key: key);
  @override
  _ProfileCommunityScreenState createState() => _ProfileCommunityScreenState();
}

class _ProfileCommunityScreenState extends State<ProfileCommunityScreen>
    with AutomaticKeepAliveClientMixin, AppStatefulViewMixin {
  List<Tab> taps = [
    const Tab(
      text: '내글',
    ),
    const Tab(
      text: '내댓글',
    ),
    const Tab(
      text: '좋아요',
    )
  ];

  late PageController _pageController;
  late final Repository _repo;
  late FirestoreApi _firestoreApi;
  late MyPostBloc _postBloc;
  late final AuthService _auth;
  late final NavigatorState _rootNavi;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _auth = context.read<AuthService>();
    _firestoreApi = FirestoreApi(_auth, FirebaseFirestore.instance);
    _repo = context.read<Repository>();
    _rootNavi = context.read<NavigationService>().rootKey.currentState!;
    _scrollController.addListener(_onScroll);

    _postBloc = MyPostBloc(_repo);
    _postBloc.setownerId(_auth.currentUserId!);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // _postBloc.disposeMypage();
    _postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    super.build(context);
    return DefaultTabController(
        length: taps.length,
        child: Scaffold(
            appBar: myPageAppBarWithTapBar(context, taps, title: '커뮤니티',
                onTap: (index) {
              _pageController.jumpToPage(index);
            }, showAcions: false),
            body: Stack(
              children: <Widget>[
                PageView(
                  controller: _pageController,
                  // scrollDirection: Axis.vertical,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _myPostList(),
                    _myReplyList(),
                    _likeList()
                  ],
                )
              ],
            )));
  }

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;

  Widget _myPostList() {
    _postBloc.getFirstOwnerPost();

    return Column(
      children: [
        AppSpacers.height20,
        Expanded(
            child: StreamBuilder<List<AppPost?>>(
          stream: _postBloc.getOwnerPostSub.stream,
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return showProgres();
            }

            if (!snapshot.hasData) return Container();

            List<AppPost?> list = snapshot.data!;
            // 하단 bottomNavigator 를 클릭할때마다 stream이 빌드됨..

            if (list.isEmpty) return showDefault();

            return ListView.separated(
                // 스크롤감지 컨트롤러
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: list.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 16,
                    endIndent: 16,
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // onSelectCell(list.elementAt(index));
                      onSelectPost(list.elementAt(index));
                    },
                    child: CommunityCard(list.elementAt(index)),
                  );
                });
          },
        ))
      ],
    );
  }

  Widget _likeList() {
    return Column(
      children: [
        AppSpacers.height20,
        Expanded(
            child: StreamBuilder<List<AppPost?>>(
          stream: _postBloc.getPostLikedStream(),
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return showProgres();
            }

            if (!snapshot.hasData) return Container();

            List<AppPost?> list = snapshot.data!;

            if (list.isEmpty) return showDefault();

            return ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: list.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 16,
                    endIndent: 16,
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      l.info(this, 'onTap 클릭 >> ');
                      // onSelectCell(list.elementAt(index));
                      onSelectPost(list.elementAt(index));
                    },
                    child: CommunityCard(list.elementAt(index)),
                  );
                });
          },
        ))
      ],
    );
  }

  Widget _myReplyList() {
    return Column(
      children: [
        AppSpacers.height20,
        Expanded(
          child: StreamBuilder<List<AppReply?>>(
            stream: _postBloc.getReplyStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showProgres();
              }

              if (!snapshot.hasData) {
                return Column(
                  children: [
                    AppSpacers.height24,
                    ImageIcon(
                      Assets.images.icEmpty,
                      size: 100,
                      color: AppColors.border,
                    ),
                    AppSpacers.height24,
                    const Text(
                      "비마이 커뮤니티에서\n다양한 이야기를 나눠보세요.",
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              }

              List<AppReply?> list = snapshot.data!;

              if (list.isEmpty) return showDefault();

              ListView listView = ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      replyWidget(list[index], context));
              return listView;
            },
          ),
        )
      ],
    );
  }

  Widget replyWidget(AppReply? reply, BuildContext Context) {
    var theme = Theme.of(context);
    TextStyle? infoStyle = theme.textTheme.bodyText2!.apply(
      fontSizeFactor: 0.9,
      color: AppColors.text50,
    );
    TextStyle? contentStyle = theme.textTheme.bodyText2!
        .apply(fontSizeFactor: 1.0, color: AppColors.text50);

    return Container(
      margin: AppEdgeInsets.vertical8.add(AppEdgeInsets.horizontal16),
      child: InkWell(
          onTap: () {
            getReplyParentPost(reply!.postUid!);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSpacers.height20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(
                                  child: Text(reply!.content.toString(),
                                      style: contentStyle,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                AppSpacers.width24,
                                reply.deleteFlag == "Y"
                                    ? Text('삭제됨',
                                        style: AppTypos.noto_light.apply(
                                            fontSizeDelta: -2.0,
                                            color: const Color(0xFFC5C8CE)))
                                    : const SizedBox()
                              ]),
                              AppSpacers.height8,
                              SizedBox(
                                height: 32,
                                child: Text(
                                  // reply.createDate.toString(),
                                  formatyyMMddHHmm(reply.createDate!),
                                  style: infoStyle,

                                  /* style: BemyAppTheme.mont_regular.apply(
                                      fontSizeDelta: -2.0,
                                      color: Color(0xFF646F7C)),*/
                                  maxLines: 2,
                                ),
                              )
                            ]),
                      ],
                    )),
                  ],
                ),
                const Divider(
                  // thickness: 1,
                  height: 1,
                ),
              ])),
    );
  }

  // 내가 쓴 리플의 본문글로 이동
  Future<AppPost?> getReplyParentPost(String? postUid) async {
    await _repo.getReplyParentPost(postUid!).then((value) {
      value!.deleteFlag == "Y"
          ? showDialog(
              context: context,
              builder: (context) {
                return const CustomPopDialog(
                  cancle: false,
                  title: Text("삭제된 글입니다"),
                  content: Text("글쓴이가 이미 삭제한 글입니다."),
                );
              })
          : goToCommunotyReaderScreen(navigator: _rootNavi, post: value);
    });
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _postBloc.getNextOwnerPost();
    }
  }

  void onSelectPost(AppPost? post) {
    // 로딩프로그레스바 필요

    post!.deleteFlag == "Y"
        ? showDialog(
            context: context,
            builder: (context) {
              return const CustomPopDialog(
                cancle: false,
                title: Text("삭제된 글입니다"),
                content: Text("글쓴이가 이미 삭제한 글입니다."),
              );
            })
        : goToCommunotyReaderScreen(navigator: _rootNavi, post: post);
  }

  showDefault() {
    return Column(
      children: [
        AppSpacers.height24,
        ImageIcon(
          Assets.images.icEmpty,
          size: 100,
          color: AppColors.border,
        ),
        AppSpacers.height24,
        const Text(
          "비마이 커뮤니티에서\n다양한 이야기를 나눠보세요.",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
