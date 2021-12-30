import 'package:application/blocs/tag_comment/tag_comment_bloc.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/log_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
part 'comment_state.dart';
part 'comment_event.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> with LogMixin {
  final Repository repository;
  final commentTxtSub = BehaviorSubject<TextEditingController>();

  // 리팩토링
  CommentBloc(this.repository) : super(CommentEmpty()) {
    // 8.0 마이그레이션시 이벤트 핸들러 필수

    on<AddComment>((event, emit) async {
      addCommentEvent(event);
    }, transformer: distinctEvent());

    on<FetchComment>((event, emit) async {
      emitCurrentState(event.postUid!);
    }, transformer: distinctEvent());

    on<RemoveReply>((event, emit) async {
      if (event.rereplyUid != null) {
        // 대 댓글 삭제
        await removeReComment(event.replyUid!, event.rereplyUid!);
        emitCurrentState(event.postUid!);
      } else if (event.replyUid != null) {
        // 원 댓글 삭제
        await removeOriginReply(event.replyUid!, event.postUid!);
        emitCurrentState(event.postUid!);
      }
    }, transformer: distinctEvent());
  }

  // 이벤트 핸들러
  EventTransformer<AddPostEvent> distinctEvent<AddPostEvent>() {
    return (events, mapper) => events.distinct().flatMap((mapper));
  }

  Future<void> addCommentEvent(AddComment event) async {
    AppReply reply = makeReplyModel(event);
    // 콜렉션 타입에 대한 구조개선이 필요함함
    // 디비상으 ㅣ tagUser값이 잘들어가는건지... --> 필요없는 값 같음.

    switch (event.taggingState.runtimeType) {
      case TaggingState:
        // 대댓글
        await addReComment(reply);
        emitCurrentState(event.postUid);
        break;

      case InitialTagCommentState:
        // 일반댓글, 초기상태에서 글등록
        await addReply(reply).catchError((onError) {
          l.info(this, 'bloc addReply catchError');
        });
        emitCurrentState(event.postUid);
        break;

      case ClearTagState:
        // 일반댓글, 태깅안하고
        await addReply(reply);
        emitCurrentState(event.postUid);
        break;

      case ReCommentTaggingState:
        // 대댓글 유저도 태그
        await addReComment(reply, reCommentTarget: event.reCommentTarget);
        emitCurrentState(event.postUid);
        break;
    }
  }

  AppReply makeReplyModel(AddComment event) {
    AppReply reply = AppReply.makeReply(
        ownerId: event.ownerId,
        postUid: event.postUid,
        content: event.content,
        nickName: event.nickName,
        /* tagUser: _postBloc!.tagSubscription.hasValue ? _postBloc!.tagSubscription.value.tagNick : null,
        replyUid: _postBloc!.tagSubscription.hasValue ? _postBloc!.tagSubscription.value.replyUid : null,*/
        tagUser: event.tagUser,
        replyUid: event.replyUid,
        collectionType: 'reply',
        // createDate: DateTime.now()

        // 사진첨부 추가
        imgDownload: event.imgDownload,
        deleteImgPath: event.deleteImgPath);

    return reply;
  }

  Future addReply(AppReply reply) async {
    WriteBatch batchComment = FirebaseFirestore.instance.batch();
    DocumentReference commentRef =
        FirebaseFirestore.instance.collection('reply').doc();
    batchComment.set(commentRef, reply.toMap() as Map<String, dynamic>);
    batchComment.update(commentRef, {'replyUid': commentRef.id});

    // 원본
    batchComment.commit().catchError((onError) {
      l.info(this, 'batchComment.commit catchError >> ');
      l.info(onError, 'batchComment.commit Exception >> ');
    });

    // 댓글 카운트(replyCount) 1 올리기
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('posts').doc(reply.postUid);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      var snap = await transaction.get(postRef);
      if (snap.exists) {
        int currentCount = snap.get('replyCount') + 1;
        transaction.update(postRef, {'replyCount': currentCount});
      }
    }).catchError((e) {
      l.info(this, 'replyCount runTransaction catchError >>');
    });
  }

  //AppRereply 대댓글 insert
  Future addReComment(AppReply reply, {String? reCommentTarget}) async {
    // reCommentTarget 값이 null 이 아니면 대댓글 유저를 태깅한 경우임
    WriteBatch batchReComment = FirebaseFirestore.instance.batch();
    DocumentReference reCommentRef = FirebaseFirestore.instance
        .collection('reply')
        .doc(reply.replyUid)
        .collection('rereply')
        .doc();

    batchReComment.set(reCommentRef, reply.toMap() as Map<String, dynamic>);
    batchReComment.update(reCommentRef, {
      'rereplyUid': reCommentRef.id,
      'collectionType': 'rereply',
      'reCommentTarget': reCommentTarget == null ? null : reCommentTarget
    });

    batchReComment.commit().catchError((onError) {
      l.info(this, 'batchReComment.commit catchError >> ');
      l.info(onError, 'batchReComment.commit Exception >> ');
    });

    // 대댓글은 카운트에 안올린다
  }

  // 원댓글 가져오기
  Future<List<AppReply?>> getReplyList(String postUid,
      {String? ownerId}) async {
    List<AppReply?> replyList = [];
    try {
      // bloc으로 구조변경시 기존 firestore_api.dart쪽 쿼리 삭제 필요
      // 마이페이지의 커뮤니티 쿼리도 버그발생 하지않나 확인해야함

      QuerySnapshot<Map<String, dynamic>> qsList = await FirebaseFirestore
          .instance
          .collection('reply')
          //.where('deleteFlag', isEqualTo: "N")
          .where(postUid != null ? 'postUid' : 'ownerId',
              isEqualTo: postUid != null ? postUid : ownerId)
          // 최신글 맨 밑으로 정렬
          .orderBy("createDate", descending: false)
          .get();

      /*qsList.docs.forEach((element) {
        AppReply? result = AppReply.fromMap(element.data());
        replyList.add(result!);
      });*/

      replyList = qsList.docs.map((value) {
        AppReply? result = AppReply.fromMap(value.data());
        return result;
      }).toList();
    } catch (e) {
      l.info(this, 'getReplyList catch e >>  ' + e.toString());
      l.info(this,
          'getReplyList catch e runtimeType >>  ' + e.runtimeType.toString());
    }
    return replyList;
  }

  // 게시글에 달린 일반댓글의 개수
  Future<int> getReplyListCount(String postUid) async {
    int count = 0;
    try {
      await FirebaseFirestore.instance
          .collection('reply')
          .where('postUid', isEqualTo: postUid)
          .where('deleteFlag', isEqualTo: 'N')
          .get()
          .then((snap) {
        count = snap.size;
      });
    } catch (e) {
      l.info(this,
          'getReplyList catch e runtimeType >>  ' + e.runtimeType.toString());
    }
    return count;
  }

  Future removeOriginReply(String replyUid, String PostUid) async {
    await repository.removePost(
        FirebaseFirestore.instance.collection('reply').doc(replyUid));

    // 댓글 카운트 -1
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('posts').doc(PostUid);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      var snap = await transaction.get(postRef);
      if (snap.exists) {
        int currentCount = snap.get('replyCount') - 1;
        transaction.update(postRef, {'replyCount': currentCount});
      }
    }).catchError((e) {
      l.info(this, 'replyCount runTransaction catchError >>');
    });
  }

  // 대댓글 삭제
  Future removeReComment(String replyUid, String reCommentUid) async {
    await repository.removePost(FirebaseFirestore.instance
        .collection('reply')
        .doc(replyUid)
        .collection('rereply')
        .doc(reCommentUid));
  }

  // 최신 댓글 상태와 갯수를 갱신해줌
  Future<void> emitCurrentState(String postUid) async {
    final result = await getReplyList(postUid);
    final replyCount = await getReplyListCount(postUid);
    emit(LoadedComment(commentList: result, replyCount: replyCount));
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    // l.info(this, '코멘트 블록 close >>');
    await commentTxtSub.close();
    return super.close();
  }
}
