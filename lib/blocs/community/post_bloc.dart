import 'dart:async';
import 'dart:io';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/log_mixin.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> with LogMixin {
  final Repository repository;
  late List<DocumentSnapshot<Map<String, dynamic>>> documentList;
  late List<AppVoteItem>? voteList;
  final postBlocTitleSub = BehaviorSubject<TextEditingController>();
  final postBlocContentSub = BehaviorSubject<TextEditingController>();

  PostBloc(
      {required PostState initialState,
      required this.repository,
      this.voteList})
      : super(initialState) {
    on<InitialOnce>((event, emit) async {
      AppPostSortEnum initSort = AppPostSortEnum.date;
      AppPostHeaderEnum initHeader = AppPostHeaderEnum.all;
      final result = await getFetchFirst();
      emit(Loaded(
          postList: result, currentHeader: initHeader, currentSort: initSort));
    });

    on<FetchNext>((event, emit) async {
      // 최근 필터가져와야함
      final result = await getFetchNext(
          filter: event.currentSort.toString(),
          header: event.currentHeader.toString());
      emit(Loaded(
          postList: result,
          currentSort: event.currentSort,
          currentHeader: event.currentHeader));
    });

    on<AddPostEvent>(
      (event, emit) async {
        l.info(this, 'event is AddPostEvent >>>>>>>');

        AppPostSortEnum initSort = AppPostSortEnum.date;
        AppPostHeaderEnum initHeader = AppPostHeaderEnum.all;

        event.voteList != null
            ? await addPostEvent(event, appVote: event.vote)
            : await addPostEvent(event);

        final result = await getFetchFirst();
        emit(Loaded(
            postList: result,
            currentHeader: initHeader,
            currentSort: initSort,
            // 블록 이벤트로 넘어오기 이전에 텍스트 검증하고 오기때문에 isValidated true 이고 블록리스너로 라우팅
            isValidated: true,
            isIncludeVote: event.voteList != null ? true : false));
      },

      /// Apply the custom `EventTransformer` to the `EventHandler`.
      transformer: distinctEvent(),
    );

    on<EditPost>((event, emit) async {
      l.info(this, 'event is EditPost >>>>>>>');
      AppPostSortEnum initSort = AppPostSortEnum.date;
      AppPostHeaderEnum initHeader = AppPostHeaderEnum.all;

      print('에딧포스트 이벤트 >> ' + event.toString());

      await editPostEvent(event);
      final result = await getFetchFirst();

      emit(Loaded(
          postList: result,
          currentHeader: initHeader,
          currentSort: initSort,
          isValidated: true));
    });

    on<SetFilter>((event, emit) async {
      // 이벤트 올때 필터가 넘어옴
      l.info(this, 'event is SetFilter >>>');
      print('SetFilter >> ' + event.toString());
      final result = await getFetchFirst(
          filter: event.currentSort.toString(),
          header: event.currentHeader.toString());
      emit(Loaded(
          postList: result,
          currentSort: event.currentSort,
          currentHeader: event.currentHeader));
    });

    on<RemovePost>((event, emit) async {
      await removeAppPost(
          postUid: event.postUid, deleteImgPath: event.deleteImgPath);
      AppPostSortEnum initSort = AppPostSortEnum.date;
      AppPostHeaderEnum initHeader = AppPostHeaderEnum.all;

      final result = await getFetchFirst();
      emit(Loaded(
          postList: result, currentHeader: initHeader, currentSort: initSort));
    });
  }

  // 이벤트 핸들러
  EventTransformer<PostEvent> distinctEvent<PostEvent>() {
    return (events, mapper) => events.distinct().flatMap((mapper));
    // return (events, mapper) => events.distinctUnique().flatMap((mapper));
  }

  @override
  PostState get initialState => const GetInit();

  // like 상태 가져오기
  Future<void>? setLikeStates(String postUid, String userId) async {
    bool result = await repository.ifExistLike(postUid, userId);
  }

  Future<List<AppPost>> getFetchFirst({String? filter, String? header}) async {
    List<AppPost> postList = [];

    try {
      documentList = await repository.fetchFirstPost(
          filter: filter ?? "createdAt", header: header ?? "", ownerId: null);

      for (var element in documentList) {
        postList.add(AppPost.fromMap(element.data()!)!);
      }
    } catch (e) {
      l.info(this, 'fetchFirstList catch e >>  ' + e.toString());
      l.info(this,
          'fetchFirstList catch e runtimeType >>  ' + e.runtimeType.toString());
    }
    return postList;
  }

  // 함수 1개로 통일
  Future getFetchNext({String? filter, String? header}) async {
    List<AppPost> postList = [];
    try {
      List<DocumentSnapshot<Map<String, dynamic>>> nextDocumentList =
          await repository.fetchNextPost(documentList,
              filter: filter ?? "createdAt",
              header: header ?? "",
              ownerId: null);
      documentList.addAll(nextDocumentList);
      if (documentList.isEmpty) {}
      for (var element in documentList) {
        postList.add(AppPost.fromMap(element.data()!)!);
      }
    } on SocketException {
      // getPostSubject.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      l.info(this, e.toString());
      // getPostSubject.sink.addError(e);
    }
    return postList;
  }

  Future addPostEvent(AddPostEvent eventPost,
      {AppVote? appVote, List<AppVoteItem>? voteitemList}) async {
    AppPost p = AppPost.makePost(
      title: eventPost.title,
      text: eventPost.text,
      ownerId: eventPost.ownerId,
      nickName: eventPost.nickName,
      header: eventPost.header,

      // eventPost.vote와 appVote는 다름..
      // vote: eventPost.vote,
      // post의 하위로 입력됨
      // vote: appVote,
      imgDownload:
          eventPost.imgDownload!.length > 6 ? eventPost.imgDownload : null,
      deleteImgPath:
          eventPost.deleteImgPath!.length > 6 ? eventPost.deleteImgPath : null,
    );

    try {
      appVote != null
          ? await repository.addPost(p,
              vote: appVote, voteItemList: eventPost.voteList)
          : await repository.addPost(p);
    } on SocketException {
      // getPostSubject.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      l.info(this, e.toString());
      l.info(this, e.runtimeType);
      // getPostSubject.sink.addError(e);
    }
  }

  // 글수정
  Future editPostEvent(EditPost eventPost) async {
    AppPost p = AppPost.makePost(
      title: eventPost.title,
      text: eventPost.text,
      ownerId: eventPost.ownerId,
      nickName: eventPost.nickName,
      header: eventPost.header,
      //임시
      // header: AppPostHeaderEnum.all,

      vote: eventPost.vote,
      imgDownload:
          eventPost.imgDownload!.length > 6 ? eventPost.imgDownload : null,
      deleteImgPath:
          eventPost.deleteImgPath!.length > 6 ? eventPost.deleteImgPath : null,
    );

    try {
      await repository.editPost(p, eventPost.postUid);
    } on SocketException {
      // getPostSubject.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      l.info(this, e.toString());
      l.info(this, e.runtimeType);
      // getPostSubject.sink.addError(e);
    }
  }

  Future removeAppPost({String? postUid, String? deleteImgPath}) async {
    // 원문글의 삭제처리//
    DocumentReference ref =
        FirebaseFirestore.instance.collection('posts').doc(postUid);

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .update({'deleteFlag': 'Y'}).catchError((e) {
      l.info(this, 'catchError >>>>>' + e.toString());
    });

    // 이미지 실제로 삭제
    /*if (deleteImgPath != null) {
      await repository.deletePostImage(deleteImgPath).catchError((e) {
        l.info(this, 'catchError >>>>>' + e.toString());
      });
    }*/
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    l.info(this, '포스트 블록 close >>');

    return super.close();
  }
}
