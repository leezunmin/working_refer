import 'dart:ui';
import 'dart:io';
import 'package:application/blocs/blocs.dart';
import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/community/community_write_screen.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'community_reader_screen.dart';

class CommunityMainScreen extends StatefulWidget {
  static const routeName = '/community/main';

  const CommunityMainScreen() : super();

  @override
  _CommunityMainScreenState createState() => _CommunityMainScreenState();
}

class _CommunityMainScreenState extends State<CommunityMainScreen>
    with AppStatefulViewMixin {
  late final NavigatorState _rootNavi;
  final _scrollController = ScrollController();

  final AppPostSortEnum _currentSort = AppPostSortEnum.date;
  final AppPostHeaderEnum _currentHeader = AppPostHeaderEnum.all;
  late final PostBloc _getBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _rootNavi = context.read<NavigationService>().rootKey.currentState!;

    _getBloc = BlocProvider.of<PostBloc>(context);
    _getBloc.add(InitialOnce());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppAppBar(Text("커뮤니티"),
          elevation: 1,
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
                icon:
                    ImageIcon(Assets.images.icPencil, color: AppColors.text60),
                onPressed: () async {
                  // 블록 인스턴스 주입부
                  _rootNavi.push((MaterialPageRoute(
                      builder: (context) => Provider?.value(
                            value: _rootNavi,
                            builder: (context, child) {
                              return MultiBlocProvider(
                                providers: [
                                  BlocProvider<ImageBloc>(
                                    create: (BuildContext context) =>
                                        ImageBloc(repo),
                                  ),
                                  BlocProvider<CommentBloc>(
                                    // lazy: true,
                                    create: (BuildContext context) =>
                                        CommentBloc(repo),
                                  ),
                                  BlocProvider<TagCommentBloc>(
                                    // lazy: true,
                                    create: (BuildContext context) =>
                                        TagCommentBloc(),
                                  ),
                                  BlocProvider<LikePostBloc>(
                                    // lazy: true,
                                    create: (BuildContext context) =>
                                        LikePostBloc(repo),
                                  ),
                                  BlocProvider<VoteBloc>(
                                    create: (BuildContext context) =>
                                        VoteBloc(repo),
                                  )
                                ],
                                child: CommunityWriteScreen(),
                              );
                            },
                          ))));
                }),
          ]),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PostBloc, PostState>(
              buildWhen: (previous, current) =>
                  previous != current && current is Loaded,
              builder: (BuildContext context, PostState state) {
                l.info(
                    this,
                    'BlocBuilder PostBloc state PostSortBottomSheet >> ' +
                        state.toString());
                if (state is Loaded) {
                  return Container(
                      height: 40,
                      margin:
                          AppEdgeInsets.top16.add(AppEdgeInsets.horizontal16),
                      child: Row(children: [
                        _dropMenu(state.currentSort!.description(), () {
                          showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              builder: (context) {
                                // 필터
                                return PostSortBottomSheet((sort) {
                                  l.info(this, 'srt > ' + sort.toString());
                                  _getBloc.add(SetFilter(
                                      currentSort: sort,
                                      currentHeader: state.currentHeader));

                                  _rootNavi.pop();
                                });
                              });
                        }),
                        AppSpacers.width16,
                        _dropMenu(state.currentHeader!.description(), () {
                          showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              builder: (context) {
                                return PostHeaderBottomSheet((header) {
                                  _getBloc.add(SetFilter(
                                      currentSort: state.currentSort,
                                      currentHeader: header));
                                  _rootNavi.pop();
                                });
                              });
                        }),
                      ]));
                }
                return SizedBox();
              }),
          BlocBuilder<PostBloc, PostState>(
              buildWhen: (previous, current) =>
                  previous != current && current is Loaded,
              builder: (BuildContext context, PostState state) {
                l.info(
                    this, 'BlocBuilder PostBloc state >> ' + state.toString());
                if (state is Loaded) {
                  l.info(this, 'state Loaded');

                  if (state.postList.isEmpty) {
                    print('state.postList.isEmpty >> ');
                    return Center(
                        child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3),
                        Text('게시글이 존재하지 않습니다.'),
                        SizedBox(height: 40)
                      ],
                    ));
                  }
                  return Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemCount: state.postList.length,
                          separatorBuilder: (context, index) {
                            return Divider(
                              indent: 16,
                              endIndent: 16,
                              thickness: 1,
                            );
                          },
                          itemBuilder: (context, index) {
                            if (state.postList.isEmpty) {
                              return Text('no Post');
                            } else {
                              return InkWell(
                                onTap: () {
                                  onSelectCell(state.postList.elementAt(index));
                                },
                                child: CommunityCard(
                                    state.postList.elementAt(index)),
                              );
                            }
                          }));
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AppSpacers.height80,
                      AppSpacers.height80,
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }

  Widget _dropMenu(String text, VoidCallback onTap) {
    // var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Text(
              text,
            ),
            ImageIcon(
              Assets.images.icArrowDownGray18,
              color: AppColors.text50,
            )
          ],
        ),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      final filterState = BlocProvider.of<PostBloc>(context).state;
      if (filterState is Loaded) {
        BlocProvider.of<PostBloc>(context).add(FetchNext(
            currentHeader: filterState.currentHeader,
            currentSort: filterState.currentSort,
            postList: filterState.postList));
      }
    }
  }

  void onSelectCell(AppPost? post) {
    // 블록 인스턴스 주입부
    _rootNavi.push((MaterialPageRoute(
        builder: (context) => Provider?.value(
              value: _rootNavi,
              builder: (context, child) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<ImageBloc>(
                      create: (BuildContext context) => ImageBloc(repo),
                    ),
                    BlocProvider<CommentBloc>(
                      // lazy: true,
                      create: (BuildContext context) => CommentBloc(repo),
                    ),
                    BlocProvider<TagCommentBloc>(
                      // lazy: true,
                      create: (BuildContext context) => TagCommentBloc(),
                    ),
                    BlocProvider<LikePostBloc>(
                      // lazy: true,
                      create: (BuildContext context) => LikePostBloc(repo),
                    ),
                    BlocProvider<VoteBloc>(
                      create: (BuildContext context) => VoteBloc(repo),
                    ),
                    BlocProvider<CommentImageBloc>(
                      create: (BuildContext context) => CommentImageBloc(repo),
                    )
                  ],
                  child: CommunityReaderScreen(post!),
                );
              },
            ))));
  }
}
