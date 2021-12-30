part of 'like_post_bloc.dart';

@immutable
abstract class PostLikeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPostLike extends PostLikeEvent {
  final String postUid;
  final String userId;

  GetPostLike(this.postUid, this.userId);

  @override
  List<Object> get props => [postUid, userId];
}

class DoPostLike extends PostLikeEvent {
  final String postUid;
  final String userId;

  DoPostLike(this.postUid, this.userId);

  @override
  List<Object> get props => [postUid, userId];
}

class ClearPostLike extends PostLikeEvent {
  final String postUid;
  final String userId;

  ClearPostLike(this.postUid, this.userId);

  @override
  List<Object> get props => [postUid, userId];
}
