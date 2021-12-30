part of 'comment_bloc.dart';

@immutable
abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentEmpty extends CommentState {}

class LoadedComment extends CommentState {
  final List<AppReply?> commentList;
  final int? replyCount;

  const LoadedComment({required this.commentList, this.replyCount});

  @override
  List<Object> get props => [
        commentList,
        {replyCount}
      ];

  @override
  String toString() =>
      'LoadedComment { items: ${commentList}, replyCount: ${replyCount} }';
}
