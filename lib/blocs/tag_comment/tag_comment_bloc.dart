import 'dart:async';
import 'package:application/services/log_mixin.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
part 'tag_comment_event.dart';
part 'tag_comment_state.dart';

class TagCommentBloc extends Bloc<TagCommentEvent, TagCommentState>
    with LogMixin {
  final replyUidSub = BehaviorSubject<String>();

  TagCommentBloc() : super(InitialTagCommentState()) {
    on<TargetTag>((event, emit) async {
      replyUidSub.sink.add(event.replyUid);

      emit(TaggingState(event.tagNick, replyUid: event.replyUid));
    });

    on<RecommentTag>((event, emit) async {
      replyUidSub.sink.add(event.replyUid);

      emit(ReCommentTaggingState(event.tagNick, event.reCommentTarget,
          replyUid: event.replyUid));
    });

    on<ClearTag>((event, emit) async {
      l.info(this, 'event is ClearTag');
      emit(ClearTagState());
    });

    on<ClearRecommentTag>((event, emit) async {
      // 클리어하고 다시 댓글등록 하면 등록이 안되는 오류
      emit(ClearReCommentTagState());
    });
  }

  // 이벤트 핸들러
  EventTransformer<TagCommentEvent> distinctEvent<TagCommentEvent>() {
    return (events, mapper) => events.distinct().flatMap((mapper));
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    await replyUidSub.close();
    return super.close();
  }
}
