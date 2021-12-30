part of 'like_post_bloc.dart';

@immutable
abstract class PostLikeState extends Equatable {
  const PostLikeState();

  @override
  List<Object> get props => [];
}

class InitialLikePostState extends PostLikeState {}

class LikeTrue extends PostLikeState {
  @override
  List<Object> get props => [];
}

class LikeFalse extends PostLikeState {
  @override
  List<Object> get props => [];
}
