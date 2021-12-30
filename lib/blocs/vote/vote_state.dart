part of 'vote_bloc.dart';

// 기존
/*@immutable
abstract class VoteState {
  const VoteState();
}*/

// 투표항목 추가하면 오류발생
@immutable
abstract class VoteState extends Equatable {
  const VoteState();

  @override
  List<Object> get props => [];
}

class InitialVoteState extends VoteState {}

class LoadedVote extends VoteState {
  final AppVote? vote;
  final List<AppVoteItem?> voteList;

  final AppCommunityEnum? viewType;
  final List<bool>? voteCheckList;
  final bool? isVoted;
  final int? selectedIndex;
  final bool? isExpired;
  final int? dDay;
  final int? dHours;

  const LoadedVote(this.vote, this.voteList,
      {this.viewType,
      this.voteCheckList,
      this.isVoted,
      this.selectedIndex,
      this.isExpired,
      this.dDay,
      this.dHours});

  // 원본
  /* @override
   List<Object> get props => [vote!, voteList, isVoted!, selectedIndex!];*/

  // yield Loaded시 하단의 객체변수 요소에서 없는 변수를 {} 에 넣지 않으면 null 오류발생함
  @override
  List<Object> get props => [
        vote!,
        voteList,
        isVoted!,
        {selectedIndex, isExpired, dDay, dHours}
      ];

  @override
  String toString() => 'LoadedVote { voteList: ${voteList}, vote: ${vote} }';
}

class EmptyVote extends VoteState {}

class EditingVoteListState extends VoteState {
  final List<TextEditingController>? controllerList;
  final int? controllerLength;
  const EditingVoteListState({this.controllerList, this.controllerLength});

  @override
  List<Object> get props => [
        {controllerList, controllerLength}
      ];

  @override
  String toString() => 'EditingVoteListState { items: ${controllerList} }';
}

class VoteSelected extends VoteState {
  final AppVote? vote;
  final List<AppVoteItem?> voteList;

  const VoteSelected(this.vote, this.voteList);
}

class LoadedVoteResult extends VoteState {
  final AppVote? vote;
  final List<AppVoteItem?> voteList;

  const LoadedVoteResult(this.vote, this.voteList);
}
