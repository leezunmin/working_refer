part of 'comment_image_bloc.dart';

@immutable
abstract class CommentImageEvent extends Equatable {
  const CommentImageEvent();

  @override
  List<Object> get props => [];
}

class InitCommentImg extends CommentImageEvent {
  InitCommentImg();
}

class PickImg extends CommentImageEvent {
  final File pickedFile;
  PickImg(this.pickedFile);
}

class RemoveCommentImg extends CommentImageEvent {
  final String? deleteImgPath;
  final String? postUid;

  RemoveCommentImg({this.deleteImgPath, this.postUid});
}
