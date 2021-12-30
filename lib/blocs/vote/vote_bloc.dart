import 'dart:async';
import 'package:application/models/datas/app_vote.dart';
import 'package:application/models/datas/app_vote_item.dart';
import 'package:application/models/enums/app_community_enum.dart';
import 'package:application/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:application/services/log_mixin.dart';

part 'vote_event.dart';
part 'vote_state.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> with LogMixin {
  final Repository repository;
  final List<TextEditingController> voteControllerList = [];
  final voteTitleSub = BehaviorSubject<TextEditingController>();
  final List<bool> voteCheckList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final checkListSub = BehaviorSubject<TextEditingController>();
  final voteDurationSub = BehaviorSubject<int>.seeded(1);

  VoteBloc(this.repository) : super(InitialVoteState()) {
    // 투표첨부된 게시글일시 투표내용 불러오기
    on<GetPostVote>((event, emit) async {
      final AppVote vote = await fetchVote(event.voteUid);
      final voteItems = await getVoteItem(event.voteUid);
      final bool isVoted =
          await repository.ifExistVote(event.voteUid, event.userId);
      final bool isExpire = ifExpired(vote.expireDate);

      // vote 안에 voteItems 객체배열 집어넣을시 해당 요소의 프로퍼티 업그레이드가 힘듬
      DateTime today = DateTime.now();
      Duration diff = vote.expireDate.difference(today);

      // false면 오늘기준으로 투표만료일에 도달하지않음. (투표진행중)
      // inHours는 남은 총시간
      /* print(' - isNagative  : ${diff.isNegative} \r\n' +
          ' - inDays  : ${diff.inDays} \r\n' +
          ' - inHours  : ${diff.inHours} \r\n');*/
      final countHours = diff.inHours - (diff.inDays * 24);

      emit(LoadedVote(vote, voteItems,
          viewType: event.viewType,
          isVoted: isVoted,
          isExpired: isExpire,
          dDay: diff.inDays,
          dHours: countHours));
    });

    // 글쓰기에서 투표창 활성화 이벤트
    on<ActivateVote>((event, emit) async {
      emit(EditingVoteListState());
    });

    // 글쓰기 투표편집창에서 투표 항목 삭제 이벤트
    on<RemoveEditingVote>((event, emit) async {
      voteControllerList.removeAt(event.index);
      emit(EditingVoteListState(
          controllerList: voteControllerList,
          controllerLength: voteControllerList.length));
    });

    // 글쓰기시 투표 항목 추가 이벤트
    on<AddVoteList>((event, emit) async {
      if (voteControllerList.length < 10) {
        // 최대 10개
        voteControllerList.add(TextEditingController());
      }
      emit(EditingVoteListState(
          controllerList: voteControllerList,
          controllerLength: voteControllerList.length));
      // 빈 [] 로 하지않고 AddVoteList 명시해주고, asyncExpandEvent 로 하면 인식됨
      // }, transformer: asyncExpandEvent());
    });

    // 투표 답변 선택 이벤트
    on<SelectVote>((event, emit) async {
      voteCheckList[event.selectedIndex] = event.isChecked;
      print('event.selectedIndex ??? ' + event.selectedIndex.toString());
      // isVoted: false, isExpired: false 둘다 충족되야 고르게끔해놨다
      // (투표한적없고 만료되지않아야)
      emit(LoadedVote(event.vote, event.voteList,
          selectedIndex: event.selectedIndex,
          isVoted: false,
          isExpired: false,
          viewType: event.viewType));
    });

    // 답변 고르고 투표 실행
    on<CastVote>((event, emit) async {
      await castVote(event.vote, event.itemUid, event.voteUser)
          .catchError((onError) {
        l.info(this, 'votebloc castVote catchError >> ');
        l.info(onError, 'votebloc castVote onError >> ');
      });

      // 투표후 바뀐 카운트 다시 가져오기
      final voteItems = await getVoteItem(event.vote.voteUid!);

      // 만료까지 남은 일과 시간 구하기
      DateTime today = DateTime.now();
      Duration diff = event.vote.expireDate.difference(today);
      int countHours = diff.inHours - (diff.inDays * 24);

      // 투표하면 isVoted 가 true가됨
      // emit(LoadedVote(event.vote, voteItems, isVoted: true, dDay: diff.inDays, dHours: countHours));

      emit(LoadedVote(event.vote, voteItems,
          isVoted: true, dDay: diff.inDays, dHours: countHours));
    }, transformer: distinctEvent());

    // 글쓰기에서 투표창 비활성화
    on<CancleVote>((event, emit) async {
      print('cancle vote >>');
      voteControllerList.clear();
      if (voteTitleSub.hasValue == true) {
        voteTitleSub.value.clear();
      }
      emit(EmptyVote());
    });
  }

  // 이벤트 핸들러
  EventTransformer<PostEvent> distinctEvent<PostEvent>() {
    return (events, mapper) => events.distinct().flatMap((mapper));
  }

  EventTransformer<PostEvent> asyncExpandEvent<PostEvent>() {
    return (events, mapper) => events.asyncExpand(mapper);
  }

  Future castVote(AppVote vote, String itemUid, String voteUser) async {
    return await repository.castVote(vote, itemUid, voteUser);
  }

  Future calculateVote(AppVote vote) async {
    return await repository.calculateVote(vote);
  }

  Future fetchVote(String voteUid) async {
    return await repository.fetchVote(voteUid);
  }

  Future getVoteItem(String voteUid) async {
    return await repository.getVoteItem(voteUid);
  }

  Future ifExistVote(String postUid, String userId) async {
    // await repository.ifExistVote(postUid, userId);
  }

  bool ifExpired(DateTime expireDate) {
    // 앞에서 뒤를  뺌
    DateTime today = DateTime.now();
    // DateTime expireDay = expireDate;
    final Duration diff = expireDate.difference(today);
    // false면 오늘기준으로 투표만료일에 도달하지않음. (투표진행중)
    print(' - isNagative  : ${diff.isNegative} \r\n' +
        ' - inDays  : ${diff.inDays} \r\n' +
        ' - inHours  : ${diff.inHours} \r\n');
    return diff.isNegative;
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    // print('보트블록 dispose >>>');
    voteTitleSub.close();
    voteDurationSub.close();
    checkListSub.close();

    return super.close();
  }
}
