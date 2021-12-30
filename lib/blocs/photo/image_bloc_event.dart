part of 'image_bloc.dart';

@immutable
abstract class ImageBlocEvent extends Equatable {
  const ImageBlocEvent();

  @override
  List<Object> get props => [];
}

class InitialCamera extends ImageBlocEvent {
  InitialCamera();
}

class ReadImg extends ImageBlocEvent {
  final String? imgPath;
  final String? deleteImgPath;
  ReadImg({this.imgPath, this.deleteImgPath});
}

class EditPostImg extends ImageBlocEvent {
  final String? imgPath;
  final String? deleteImgPath;
  EditPostImg({this.imgPath, this.deleteImgPath});
}

class GetLoadImage extends ImageBlocEvent {
  final File pickedFile;
  GetLoadImage(this.pickedFile);
}

class DeleteImage extends ImageBlocEvent {
  final String? deleteImgPath;
  final String? postUid;

  DeleteImage({this.deleteImgPath, this.postUid});
}

class CancleImage extends ImageBlocEvent {
  final String? deleteImgPath;
  final String? postUid;

  CancleImage({this.deleteImgPath, this.postUid});
}
