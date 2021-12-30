import 'dart:async';
import 'package:application/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/src/transformers/backpressure/debounce.dart';
import 'package:rxdart/src/transformers/flat_map.dart';

part 'like_post_event.dart';
part 'like_post_state.dart';

class LikePostBloc extends Bloc<PostLikeEvent, PostLikeState> {
  final Repository repository;

  LikePostBloc(this.repository) : super(InitialLikePostState()) {
    on<GetPostLike>((event, emit) async {
      // bool result = await setLikeStates(event.postUid, event.userId);
      if (!await setLikeStates(event.postUid, event.userId)) {
        emit(LikeFalse());
      } else {
        emit(LikeTrue());
      }
    });

    on<DoPostLike>((event, emit) async {
      // await 하면 딜레이생김
      plusLike(event.postUid, event.userId);
      emit(LikeTrue());
    }, transformer: debounce());
    // }, transformer: asyncExpand());
    // }, transformer: distinctEvent());

    on<ClearPostLike>((event, emit) async {
      // await 하면 딜레이생김
      minusLike(event.postUid, event.userId);
      emit(LikeFalse());
    }, transformer: debounce());
    // }, transformer: asyncExpand());
    // }, transformer: distinctEvent());
  }

  // 이벤트 핸들러
  EventTransformer<PostLikeEvent> distinctEvent<PostLikeEvent>() {
    return (events, mapper) => events.distinct().flatMap((mapper));
  }

  EventTransformer<PostLikeEvent> asyncExpand<PostLikeEvent>() {
    return (events, mapper) => events.asyncExpand(mapper);
  }

  EventTransformer<PostLikeEvent> debounce<PostLikeEvent>() {
    return (events, mapper) =>
        events.debounceTime(const Duration(milliseconds: 10)).flatMap(mapper);
  }

  // like 상태 가져오기
  Future<bool> setLikeStates(String postUid, String userId) async {
    /*bool result = await repository.ifExistLike(postUid, userId);
    return result;*/

    return await repository.ifExistLike(postUid, userId);
  }

  Future minusLike(String? postUid, String? userId) {
    return repository.decreasePostLike(postUid, userId);
  }

  Future plusLike(String? postUid, String? userId) {
    return repository.increasePostLike(postUid, userId);
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    return super.close();
  }
}
