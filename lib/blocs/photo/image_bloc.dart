import 'dart:async';
import 'dart:io';
import 'package:application/repositories/repository.dart';
import 'package:application/services/log_mixin.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
part 'image_bloc_event.dart';
part 'image_bloc_state.dart';

class ImageBloc extends Bloc<ImageBlocEvent, ImageBlocState> with LogMixin {
  final Repository repository;

  ImageBloc(this.repository) : super(ImagePickerEmpty()) {
    final String? userId = repository.appServiceApi.authBloc.currentUserId;

    on<InitialCamera>((event, emit) async {
      emit(ImagePickerEmpty());
    });

    on<ReadImg>((event, emit) async {
      emit(LoadedImg(
          imgDownload: event.imgPath, deleteImgPath: event.deleteImgPath));
    });

    on<EditPostImg>((event, emit) async {
      emit(EditImg(
          imgDownload: event.imgPath, deleteImgPath: event.deleteImgPath));
    });

    // on<CameraImagePicked>((event, emit) async {
    on<GetLoadImage>((event, emit) async {
      print('카메라 이미지 픽 >> ');
      Map<String, dynamic> result =
          await repository.uploadPostPhoto(userId, event.pickedFile);

      emit(ImagePickerSuccess(
          image: event.pickedFile,
          imgDownload: result['downUrl'],
          deleteImgPath: result['fullPath']));
    });

    on<DeleteImage>((event, emit) async {
      l.info(this, 'event.deleteImgPath ' + event.deleteImgPath.toString());

      if (event.postUid != null) {
        l.info(this, 'event.postUid != null');
        await removeImagePath(
            postUid: event.postUid, deleteImgPath: event.deleteImgPath!);
      }
      await repository.clearImageCache(event.deleteImgPath!);

      emit(ImagePickerEmpty());
    });

    // 글쓰던 도중 이미지 업로드 취소
    on<CancleImage>((event, emit) async {
      l.info(this, 'event.deleteImgPath ' + event.deleteImgPath.toString());

      // 실제로 이미지 삭제
      try {
        await repository.deletePostImage(event.deleteImgPath!);
      } catch (e) {}
      if (event.postUid != null) {
        l.info(this, 'event.postUid != null');
        await removeImagePath(
            postUid: event.postUid, deleteImgPath: event.deleteImgPath!);
      }
      await repository.clearImageCache(event.deleteImgPath!);

      emit(ImagePickerEmpty());
    });
  }

  Future removeImagePath({String? postUid, String? deleteImgPath}) async {
    // 이미지 경로를 삭제해서 안보이게함
    DocumentReference ref =
        FirebaseFirestore.instance.collection('posts').doc(postUid);

    print('postUid >>' + postUid!);

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .update({'imgDownload': ""}).catchError((e) {
      l.info(this, 'update img catchError >>>>>' + e.toString());
      l.info(this, 'update img catchError >>>>>' + e.runtimeType.toString());
    });
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    // l.info(this, '이미지 블록 dispose');
    return super.close();
  }
}
