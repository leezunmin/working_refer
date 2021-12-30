import 'package:application/blocs/vote/vote_bloc.dart';
import 'package:application/models/datas/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/auth/auth_state_service.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:application/models/enums/app_community_enum.dart';

class VoteChartScreen extends StatefulWidget {
  final String voteUid;
  final AppCommunityEnum viewType;

  final VoidCallback? onVote;
  final AppVote? vote;
  final String? postUid;
  final Repository? repo;

  const VoteChartScreen(this.voteUid, this.viewType,
      {this.onVote, this.vote, this.postUid, this.repo});

  @override
  _VoteChartScreenState createState() =>
      _VoteChartScreenState(voteUid, viewType,
          onVote: onVote, vote: vote, postUid: postUid);
}

class _VoteChartScreenState extends State<VoteChartScreen>
    with AppStatefulViewMixin {
  final String voteUid;
  final AppCommunityEnum viewType;
  final VoidCallback? onVote;
  final AppVote? vote;
  final String? postUid;

  final double appWidth = 0;
  late VoteBloc _voteBloc;
  late AuthStateService _authStateService;

  TextStyle? titleStyle;
  TextStyle? infoStyle;

  _VoteChartScreenState(this.voteUid, this.viewType,
      {this.onVote, this.vote, this.postUid});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _authStateService = context.read<AuthStateService>();
    _voteBloc = BlocProvider.of<VoteBloc>(context);

    // 원본
    _voteBloc
        .add(GetPostVote(voteUid, _authStateService.currentMe!.id, viewType));
  }

  @override
  void dispose() {
    // print('보트 차트뷰 dispose >> ');
    super.dispose();
    _voteBloc.add(CancleVote());
  }

  @override
  Widget build(BuildContext context) {
    final userId = _authStateService.currentMe!.id.toString();
    final theme = Theme.of(context);
    titleStyle = theme.textTheme.bodyText1!
        .apply(fontSizeFactor: 1.2, color: AppColors.text50);
    infoStyle = theme.textTheme.bodyText2!
        .apply(fontSizeFactor: 1, color: AppColors.text50);

    return BlocBuilder<VoteBloc, VoteState>(
        // buildWhen: (previous, current) => previous != current && current is LoadedComment,
        builder: (BuildContext context, VoteState state) {
      // l.info(this, 'BlocBuilder VoteBloc state >> ' + state.toString());

      if (state is InitialVoteState) {
        return Container();
      } else if (state is LoadedVote) {
        // print('보트 스테이트 >> ' + state.toString());

        if (state.vote == null) {
          return Text('올바르지 못한 투표입니다.');
        } else {
          return Container(
            // width: viewportConstraints.maxWidth,
            width: MediaQuery.of(context).size.width - 32,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.border),
                borderRadius: AppBorderRadius.circular8),
            child: Column(
              children: [
                AppSpacers.height16,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppSpacers.width16,
                    Expanded(
                        child: Text(
                      state.vote!.title,
                      style: titleStyle,
                      textAlign: TextAlign.start,
                    )),
                    AppSpacers.width24,
                  ],
                ),

                SizedBox(height: 20),

                // 투표전, 투표만료전 UI
                (state.isVoted == false &&
                        state.isExpired == false &&
                        state.viewType == AppCommunityEnum.readVote)
                    ? LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints boxConstraints) {
                        // print( '투표전 최대크기  ' + boxConstraints.maxWidth.toString() );
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.voteList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  // margin: AppEdgeInsets.horizontal16.add(AppEdgeInsets.top16),
                                  // margin: AppEdgeInsets.horizontal16,
                                  margin: EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  height: 50,
                                  // 투표전) 리스트빌더뷰 개별 투표 아이템 전체
                                  // 부모위젯에서 border가 2빠짐
                                  width: boxConstraints.maxWidth,
                                  decoration: BoxDecoration(
                                      // color: AppColors.lightGrey,
                                      border: Border.all(
                                          width: 1, color: AppColors.black12),
                                      borderRadius: AppBorderRadius.circular8),
                                  child: LabeledCheckbox(
                                    label:
                                        state.voteList[index]!.text.toString(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    value: _voteBloc.voteCheckList[index],
                                    onChanged: (bool isSelected) {
                                      bool isChecked = false;

                                      for (int i = 0;
                                          i <= state.voteList.length - 1;
                                          i++) {
                                        if (_voteBloc.voteCheckList[i] ==
                                            true) {
                                          isChecked = true;
                                        }
                                      }
                                      if ((isChecked == false) &&
                                          (isSelected == true)) {
                                        _voteBloc.add(SelectVote(
                                            index,
                                            isSelected,
                                            state.vote,
                                            state.voteList,
                                            state.viewType));
                                      } else if (isSelected == false) {
                                        _voteBloc.add(SelectVote(
                                            index,
                                            isSelected,
                                            state.vote,
                                            state.voteList,
                                            state.viewType));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('하나만 고를 수 있습니다.'),
                                          duration: Duration(seconds: 1),
                                        ));
                                      }
                                    },
                                  ));
                            });
                      })
                    : Column(
                        children: [
                          // 투표후 결과 위젯
                          VoteResultBox(state.voteList, userId),

                          SizedBox(height: 25),
                          state.isExpired == true
                              ? Text(
                                  '마감된 투표입니다.',
                                  style: theme.textTheme.bodyText2!.apply(
                                      color: AppColors.lightGrey,
                                      fontSizeFactor: 1),
                                )
                              : Text(
                                  '투표 마감까지 ${state.dDay}일 ${state.dHours}시간 남았습니다.',
                                  style: theme.textTheme.bodyText2!.apply(
                                      color: AppColors.lightGrey,
                                      fontSizeFactor: 1),
                                ),
                        ],
                      ),

                AppSpacers.height12,

                (state.viewType == AppCommunityEnum.editVote ||
                        state.isVoted == true ||
                        state.isExpired == true)
                    ? Container()
                    : InkWell(
                        onTap: () {
                          if (validateVote(state.voteList.length) == true) {
                            // 고른 index를 알기위한 반복문
                            for (int i = 0;
                                i <= state.voteList.length - 1;
                                i++) {
                              if (_voteBloc.voteCheckList[i] == true) {
                                _voteBloc.add(CastVote(
                                    state.voteList[i]!.itemUid.toString(),
                                    state.vote!,
                                    userId));
                              }
                            }
                          }
                        },
                        child: Container(
                            margin: AppEdgeInsets.horizontal16
                                .add(AppEdgeInsets.bottom8),
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff646F7C),
                                border: Border.all(
                                    width: 1, color: AppColors.border),
                                borderRadius: AppBorderRadius.circular8),
                            child: Center(
                              child: Text("투표하기",
                                  style: theme.textTheme.bodyText1!
                                      .copyWith(color: AppColors.text40)),
                            )),
                      ),

                AppSpacers.height16,
                AppSpacers.height16,
              ],
            ),
          );
        }
      }
      return SizedBox();
    });
  }

  bool validateVote(int listLength) {
    int countTrue = 0;
    late bool result;

    for (int i = 0; i <= listLength - 1; i++) {
      if (_voteBloc.voteCheckList[i] == true) {
        countTrue = countTrue + 1;
      }
    }
    if (countTrue >= 2 || countTrue == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmDialog(
              // left: Text('취소'),
              // right: Text('수정하기'),
              onPressedRight: () {
                // Navigator.of(context).pop(MeetWriteScreen.routeName);
              },
              title: Text(countTrue == 0 ? '투표 항목을 골라주세요' : '하나만 골라주세요'),
            );
          });
      result = false;
    } else if (countTrue == 1) {
      result = true;
    }
    return result;
  }
}

// 투표전
class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              checkColor: Colors.black,
              activeColor: Colors.cyan,
              hoverColor: Colors.deepOrange,
              fillColor: MaterialStateColor.resolveWith((states) {
                return Colors.white;
              }),
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VoteResultBox extends StatelessWidget {
  final List<AppVoteItem?> voteList;
  final String userId;

  const VoteResultBox(this.voteList, this.userId);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextStyle? infoStyle = theme.textTheme.bodyText2!
        .apply(fontSizeFactor: 1, color: AppColors.text50);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      // print('겉 빈 테두리 최대 ' + boxConstraints.maxWidth.toString());

      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: voteList.length,
          itemBuilder: (context, index) {
            return
                // 1번 투표아이템 테두리 컨테이너
                Container(
                    // margin: AppEdgeInsets.horizontal16,
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    height: 50,
                    width: boxConstraints.maxWidth,
                    decoration: BoxDecoration(
                        border: voteList[index]!.voteUserArray.contains(userId)
                            ? Border.all(width: 1, color: AppColors.primary)
                            : Border.all(width: 1, color: AppColors.black12),
                        borderRadius: AppBorderRadius.circular8),
                    child: Stack(
                      children: [
                        // 2번 투표아이템에서 색칠되는 컨테이너
                        Positioned(
                          child: LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints innerBoxConstraints) {
                            // print('컬러 박스 최대 >> ' + innerBoxConstraints.maxWidth.toString());
                            return Container(
                              height: 50.0,
                              width: ((voteList[index]!.percent! / 100) *
                                          100) ==
                                      100.0
                                  ? innerBoxConstraints.maxWidth
                                  : ((voteList[index]!.percent! / 100) * 100) ==
                                          0.00
                                      ? 0
                                      : ((voteList[index]!.percent! / 100) *
                                          innerBoxConstraints.maxWidth),
                              decoration: BoxDecoration(
                                  color: AppColors.gray5,
                                  border: Border.all(
                                      width: 0, color: AppColors.gray5),
                                  borderRadius:
                                      // 100프로일때는 모서리가 삐져나가서 예외처리
                                      ((voteList[index]!.percent! / 100) *
                                                  100) ==
                                              100.0
                                          ? AppBorderRadius.circular8
                                          : BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8))),
                            );
                          }),
                        ),

                        Positioned(
                          child: Container(
                              width: boxConstraints.maxWidth * 0.65,
                              height: 50,
                              child: Text(
                                voteList[index]!.text.toString(),
                                /*overflow: TextOverflow.ellipsis*/
                                style: infoStyle.apply(color: AppColors.text50),
                              )),
                          left: boxConstraints.maxWidth * 0.04,
                          top: 15,
                        ),
                        Positioned(
                            child: Container(
                                width: boxConstraints.maxWidth * 0.3,
                                height: 50,
                                child: Text(
                                    voteList[index]!
                                            .percent!
                                            .floor()
                                            .toString() +
                                        '%',
                                    style: infoStyle.apply(
                                        color: AppColors.primary),
                                    overflow: TextOverflow.ellipsis)),
                            left: boxConstraints.maxWidth * 0.7,
                            top: 15),
                      ],
                    ));
          });
    });
  }
}
