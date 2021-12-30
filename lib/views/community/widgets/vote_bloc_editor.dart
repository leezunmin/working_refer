import 'dart:async';

import 'package:application/generated/assets.gen.dart';
import 'package:application/models/datas/models.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';

import 'package:application/blocs/vote/export_vote_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoteBlocEditor extends StatefulWidget {
  const VoteBlocEditor();

  @override
  _VoteBlocEditorState createState() => _VoteBlocEditorState();
}

class _VoteBlocEditorState extends State<VoteBlocEditor>
    with AppStatefulViewMixin {
  final TextEditingController? voteTitle = TextEditingController();
  final TextEditingController? editingController = TextEditingController();
  late final VoteBloc _voteBloc;

  _VoteBlocEditorState();

  @override
  void initState() {
    super.initState();
    _voteBloc = BlocProvider.of<VoteBloc>(context);
    _voteBloc.voteTitleSub.sink.add(voteTitle!);
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('투표 에디터 Widget Build >>> ');
    final theme = Theme.of(context);

    return BlocBuilder<VoteBloc, VoteState>(
        // buildWhen: (previous, current) => previous != current && current is EditingVoteListState,
        builder: (BuildContext context, VoteState state) {
      if (state is EditingVoteListState) {
        return Container(
          // 원본
          width: MediaQuery.of(context).size.width - 32,
          // width: MediaQuery.of(context).size.width + 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.border),
              borderRadius: AppBorderRadius.circular8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        child: TextField(
                      onChanged: (value) {
                        // var text = value;
                      },
                      controller: voteTitle,
                      decoration: InputDecoration(
                          hintStyle: theme.textTheme.subtitle1!
                              .copyWith(color: AppColors.text40),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counter: SizedBox(
                            width: 0,
                            height: 0,
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 24, bottom: 11, top: 11, right: 15),
                          hintText: "투표 주제를 입력하세요"),
                      maxLength: 30,
                      maxLines: 1,
                    )),
                  ),
                  IconButton(
                    icon: ImageIcon(
                      Assets.images.icCancelCircleBl24,
                      color: AppColors.text50,
                    ),
                    onPressed: () async {
                      if (_voteBloc.voteDurationSub.hasValue) {
                        _voteBloc.voteDurationSub.sink.add(1);
                      }
                      _voteBloc.add(CancleVote());
                    },
                  ),
                  AppSpacers.width16
                ],
              ),
              state.controllerList != null
                  ? ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // controller: _scrollController,
                      itemCount: state.controllerList!.length,
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                      itemBuilder: (context, index) {
                        return Container(
                            margin: AppEdgeInsets.horizontal16
                                .add(AppEdgeInsets.bottom8),
                            height: 50,
                            decoration: BoxDecoration(
                                color: AppColors.gray[020],
                                border: Border.all(
                                    width: 1, color: AppColors.border),
                                borderRadius: AppBorderRadius.circular8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      controller: state.controllerList![index],
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintStyle: theme.textTheme.bodyText1!
                                            .copyWith(color: AppColors.text40),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 16,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "답변",
                                        counter: SizedBox(
                                          width: 0,
                                          height: 0,
                                        ),
                                      ),
                                      maxLength: 30,
                                      maxLines: 1,
                                      style: theme.textTheme.bodyText1!
                                          .copyWith(color: AppColors.coolGray)),
                                ),
                                IconButton(
                                    icon: ImageIcon(
                                      Assets.images.icMinusCircleGray24,
                                      color: AppColors.text40,
                                    ),
                                    onPressed: () {
                                      _voteBloc.add(RemoveEditingVote(index));
                                    })
                              ],
                            ));
                      })
                  : SizedBox(),
              InkWell(
                onTap: () {
                  _voteBloc.add(AddVoteList());
                },
                child: Container(
                    margin:
                        AppEdgeInsets.horizontal16.add(AppEdgeInsets.bottom8),
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.border),
                        borderRadius: AppBorderRadius.circular8),
                    child: Center(
                      child: Text("선택 추가하기",
                          style: theme.textTheme.bodyText1!
                              .copyWith(color: AppColors.text40)),
                    )),
              ),
              Container(
                margin: AppEdgeInsets.all16.add(AppEdgeInsets.horizontal8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("투표기간",
                        style: theme.textTheme.subtitle2!
                            .copyWith(color: AppColors.text50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: Image(
                                image: Assets.images.icMinusCircleSolidGray18),
                            onPressed: () {
                              // 1 빼기
                              int currentDuration =
                                  _voteBloc.voteDurationSub.stream.value;
                              if (currentDuration > 1) {
                                _voteBloc.voteDurationSub
                                    .add(currentDuration - 1);
                              }
                            }),
                        StreamBuilder<int>(
                            stream: _voteBloc.voteDurationSub.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text("${snapshot.data}일");
                              }
                              return SizedBox();
                            }),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: Image(
                              image: Assets.images.icAddCircleSolidGray18),
                          onPressed: () {
                            // +1 더하기
                            int currentDuration =
                                _voteBloc.voteDurationSub.stream.value;
                            if (currentDuration < 7) {
                              _voteBloc.voteDurationSub
                                  .add(currentDuration + 1);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      } else if (state is EmptyVote) {
        return Container();
      }
      return Container();
    });
  }
}
