part of 'vote_bloc.dart';

@immutable
abstract class VoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPostVote extends VoteEvent {
  final String voteUid;
  final String userId;
  final AppCommunityEnum viewType;

  GetPostVote(this.voteUid, this.userId, this.viewType);
}

class RemoveEditingVote extends VoteEvent {
  // String? postUid;
  final int index;

  RemoveEditingVote(this.index);
}

class ActivateVote extends VoteEvent {
  ActivateVote();
}

class AddVoteList extends VoteEvent {
  AddVoteList();
}

/*class AddVoteList extends VoteEvent {
  AddVoteList();

  @override
  List<Object> get props => [AddVoteList];
  // 빈 [] 로 하지않고 AddVoteList 명시해주고, asyncExpandEvent 로 하면 인식됨
}*/

class CancleVote extends VoteEvent {
  CancleVote();
}

class SelectVote extends VoteEvent {
  final int selectedIndex;
  final bool isChecked;
  final AppVote? vote;
  final List<AppVoteItem?> voteList;
  final AppCommunityEnum? viewType;

  SelectVote(this.selectedIndex, this.isChecked, this.vote, this.voteList,
      this.viewType);

  @override
  List<Object> get props =>
      [selectedIndex, isChecked, vote!, voteList, viewType.toString()];
}

class CastVote extends VoteEvent {
  // final List<AppVoteItem?> voteList;
  final String itemUid;
  final AppVote vote;
  final String voteUser;

  CastVote(this.itemUid, this.vote, this.voteUser);

  @override
  List<Object> get props => [itemUid, vote, voteUser];
}

class ClearVote extends VoteEvent {
  ClearVote();
}
