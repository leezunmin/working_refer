part of 'image_bloc.dart';

@immutable
abstract class ImageBlocState extends Equatable {
  const ImageBlocState();

  @override
  List<Object> get props => [];
}

class ImagePickerEmpty extends ImageBlocState {
  @override
  List<Object> get props => [];
}

class ImagePickerLoading extends ImageBlocState {}

class Uploading extends ImageBlocState {}

class ImagePickerSuccess extends ImageBlocState {
  final File image;
  final String imgDownload;
  final String deleteImgPath;

  const ImagePickerSuccess(
      {required this.image,
      required this.imgDownload,
      required this.deleteImgPath});

  @override
  List<Object> get props => [image, 'List object get props: $image'];
}

class LoadedImg extends ImageBlocState {
  final String? imgDownload;
  final String? deleteImgPath;

  const LoadedImg({this.imgDownload, this.deleteImgPath});

// 원
/*@override
  List<Object> get props => [];
  List<Object> get props => [deleteImgPath!];*/

/*@override
  List<Object> get props => [deleteImgPath!, imgDownload!];*/

}

class EditImg extends ImageBlocState {
  final String? imgDownload;
  final String? deleteImgPath;

  const EditImg({this.imgDownload, this.deleteImgPath});
}
