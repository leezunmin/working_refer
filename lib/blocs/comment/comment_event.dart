part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchComment extends CommentEvent {
  // 댓글달때 태그설정
  final String? postUid;
  final String? ownerId;

  FetchComment({this.postUid, this.ownerId});

  // 추가해봄
  @override
  List<Object> get props => [postUid!, ownerId!];
}

class AddComment extends CommentEvent {
  final String postUid;
  final String? ownerId;
  final String? nickName;
  final String? content;
  final String? tagUser;
  // String? collectionType;
  // final String? taggingState;
  final dynamic? taggingState;
  final String? replyUid;
  final String? reCommentTarget;
  final String? imgDownload;
  final String? deleteImgPath;

  AddComment(
    this.postUid, {
    // this.postUid,
    this.ownerId,
    this.nickName,
    this.content,
    this.tagUser,
    this.taggingState,
    this.replyUid,
    this.reCommentTarget,
    this.imgDownload,
    this.deleteImgPath,
  });

  @override
  List<Object> get props => [
        postUid,
        content!,
        {
          replyUid,
          tagUser,
          taggingState,
          reCommentTarget,
          imgDownload,
          deleteImgPath
        }
      ];
}

class AddReComment extends CommentEvent {
  final String replyUid;
  AddReComment(this.replyUid);
}

class RemoveReply extends CommentEvent {
  final String? replyUid;
  final String? postUid;
  final String? rereplyUid;

  RemoveReply({this.replyUid, this.postUid, this.rereplyUid});

  // @override String toString() => 'RemoveReply replyUid | $replyUid : rereplyUid >>> $rereplyUid';

  @override
  List<Object> get props => [
        postUid!,
        {replyUid, rereplyUid}
      ];
}
