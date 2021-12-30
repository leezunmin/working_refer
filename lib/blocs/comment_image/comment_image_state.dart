part of 'comment_image_bloc.dart';

@immutable
abstract class CommentImageState extends Equatable {
  const CommentImageState();

  @override
  List<Object> get props => [];
}

class CommentImgEmpty extends CommentImageState {
  const CommentImgEmpty();

  @override
  List<Object> get props => [];
}

class ImgLoadSucced extends CommentImageState {
  final File image;
  final String imgDownload;
  final String deleteImgPath;

  const ImgLoadSucced(
      {required this.image,
      required this.imgDownload,
      required this.deleteImgPath});

  @override
  List<Object> get props => [image, 'List object get props: $image'];
}
