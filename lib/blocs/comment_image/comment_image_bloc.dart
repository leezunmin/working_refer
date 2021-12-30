import 'package:application/repositories/repository.dart';
import 'package:application/services/log_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:io';
part 'comment_image_event.dart';
part 'comment_image_state.dart';

class CommentImageBloc extends Bloc<CommentImageEvent, CommentImageState>
    with LogMixin {
  final Repository repository;

  CommentImageBloc(this.repository) : super(CommentImgEmpty()) {
    final String? userId = repository.appServiceApi.authBloc.currentUserId;

    on<InitCommentImg>((event, emit) async {
      emit(CommentImgEmpty());
    });

    on<PickImg>((event, emit) async {
      print('PickedLocalImg 발생 >> ');
      Map<String, dynamic> result =
          await repository.uploadPostPhoto(userId, event.pickedFile);

      emit(ImgLoadSucced(
          image: event.pickedFile,
          imgDownload: result['downUrl'],
          deleteImgPath: result['fullPath']));
    });

    on<RemoveCommentImg>((event, emit) async {
      try {
        await repository.deletePostImage(event.deleteImgPath!);
      } catch (e) {
        l.info(this, 'ImageDeleted e' + e.toString());
        l.info(this, 'ImageDeleted e' + e.runtimeType.toString());
      }

      if (event.postUid != null) {
        l.info(this, 'event.postUid != null');
        await removeImagePath(
            postUid: event.postUid, deleteImgPath: event.deleteImgPath!);
      }
      await repository.clearImageCache(event.deleteImgPath!);

      emit(CommentImgEmpty());
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
    // l.info(this, '코멘트 이미지 블록 close >>');
    return super.close();
  }
}
