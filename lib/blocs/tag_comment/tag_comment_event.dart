part of 'tag_comment_bloc.dart';

@immutable
abstract class TagCommentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TargetTag extends TagCommentEvent {
  final String tagNick;
  final String replyUid;

  TargetTag(this.tagNick, this.replyUid);
}

class ClearTag extends TagCommentEvent {}

class RecommentTag extends TagCommentEvent {
  final String tagNick;
  final String replyUid;
  final String reCommentTarget;

  RecommentTag(this.tagNick, this.replyUid, this.reCommentTarget);
}

class ClearRecommentTag extends TagCommentEvent {}
