part of 'tag_comment_bloc.dart';

@immutable
abstract class TagCommentState extends Equatable {
  const TagCommentState();

  @override
  List<Object> get props => [];
}

class InitialTagCommentState extends TagCommentState {}

class TaggingState extends TagCommentState {
  final String targetNick;
  final String? replyUid;
  const TaggingState(this.targetNick, {this.replyUid});
}

class ReCommentTaggingState extends TagCommentState {
  final String targetNick;
  final String? replyUid;
  final String reCommentTarget;

  const ReCommentTaggingState(this.targetNick, this.reCommentTarget,
      {this.replyUid});
}

class ClearTagState extends TagCommentState {}

class ClearReCommentTagState extends TagCommentState {}
