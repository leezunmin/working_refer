import 'package:application/blocs/blocs.dart';
import 'package:application/blocs/validate_mixin.dart';
import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

mixin BlocInterface<T extends StatefulWidget> on State<T> {
  late AuthStateService _authStateService;
  final targetNick = BehaviorSubject<String>.seeded("");
  final reCommentTargetNick = BehaviorSubject<String>.seeded("");
  final nickTagged = BehaviorSubject<String>.seeded("");
  final imgPathSub = BehaviorSubject<String?>();
  final deletePathSub = BehaviorSubject<String?>.seeded("");

  @override
  void initState() {
    L.instance.info(this, 'BlocInterface initState >>>');

    super.initState();

    /*print('블록 인터페이스 해쉬코드 >> ' + this.hashCode.toString());
    print('블록 인터페이스 toString >> ' + this.toString());*/
    /*_authStateService = context.read<AuthStateService>();
    _getBloc = BlocProvider.of<PostBloc>(context);*/
  }

  @override
  void dispose() {
    print('bloc interface dispose');
    targetNick.close();
    reCommentTargetNick.close();
    nickTagged.close();

    imgPathSub.close();
    deletePathSub.close();
    super.dispose();
  }

  dynamic makeBlocEvent(BlocEventEnum eventEnum,
      {AppPostHeaderEnum? currentHeader,
      AppVote? vote,
      AppPost? post,
      List<AppVoteItem>? voteList,
      String? postUid,
      String? imgDownload,
      String? deletePathForModify}) {
    _authStateService = context.read<AuthStateService>();
    final _getBloc = BlocProvider.of<PostBloc>(context);
    dynamic eventClass = null;

    String imgUrl = "";
    String deletePath = "";

    // 첨부된 사진의 상태값이 있으면 이미지 주소값을 가져온다.
    final _imageState = BlocProvider.of<ImageBloc>(context).state;

    if (_imageState is ImagePickerSuccess) {
      imgUrl = _imageState.imgDownload;
      deletePath = _imageState.deleteImgPath;
    }

    switch (eventEnum) {
      // 투표포함안된 게시글 등록의 값 처리
      case BlocEventEnum.addPost:
        eventClass = AddPostEvent(
            ownerId: _authStateService.currentMe!.id,
            nickName: _authStateService.currentMe!.profile.nickName,
            title: _getBloc.postBlocTitleSub.valueOrNull!.text,
            text: _getBloc.postBlocContentSub.valueOrNull!.text,
            header: currentHeader,
            imgDownload: imgUrl,
            deleteImgPath: deletePath,
            voteActivate: false);
        break;

      // 투표가 첨부된 게시글의 등록 값 처리
      case BlocEventEnum.addPostVoted:
        eventClass = AddPostEvent(
            ownerId: _authStateService.currentMe!.id,
            nickName: _authStateService.currentMe!.profile.nickName,
            title: _getBloc.postBlocTitleSub.valueOrNull!.text,
            text: _getBloc.postBlocContentSub.valueOrNull!.text,
            header: currentHeader,
            imgDownload: imgUrl,
            deleteImgPath: deletePath,
            voteActivate: true,
            voteList: voteList,
            vote: vote);
        break;

      // 게시글 수정시의 값 처리
      case BlocEventEnum.editPost:
        eventClass = EditPost(
            postUid: postUid,
            ownerId: _authStateService.currentMe!.id,
            nickName: _authStateService.currentMe!.profile.nickName,
            title: _getBloc.postBlocTitleSub.valueOrNull!.text,
            text: _getBloc.postBlocContentSub.valueOrNull!.text,
            header: currentHeader,
            imgDownload: imgDownload,
            deleteImgPath: deletePathForModify);
        break;

      // 댓글과 대댓글 이벤트 발생시의 value 처리
      case BlocEventEnum.addComment:
        final _commentImgState =
            BlocProvider.of<CommentImageBloc>(context).state;

        final _commenBloc = BlocProvider.of<CommentBloc>(context);
        final _tagCommentBloc = BlocProvider.of<TagCommentBloc>(context);
        final Me me = _authStateService.currentMe!;

        final _commentImgBloc = BlocProvider.of<CommentImageBloc>(context);
        // 첨부된 사진의 상태값이 있으면 이미지 주소값을 가져온다.
        String commentImgUrl = "";
        String commentImgdeletePath = "";

        if (_commentImgState is ImgLoadSucced) {
          commentImgUrl = _commentImgState.imgDownload;
          commentImgdeletePath = _commentImgState.deleteImgPath;
        }

        eventClass = AddComment(
          post!.postUid!,
          // postUid: post!.postUid,
          ownerId: me.id,
          nickName: me.profile.nickName,
          content: _commenBloc.commentTxtSub.stream.value.text,
          replyUid: (_commentImgState is ClearTag ||
                  _commentImgState is ClearRecommentTag)
              ? null
              : _tagCommentBloc.replyUidSub.hasValue
                  ? _tagCommentBloc.replyUidSub.value
                  : null,
          taggingState: _tagCommentBloc.state,
          tagUser: targetNick.stream.value,
          reCommentTarget: reCommentTargetNick.stream.value == ""
              ? null
              : reCommentTargetNick.stream.value,
          imgDownload: commentImgUrl,
          deleteImgPath: commentImgdeletePath,
        );

        break;

      default:
        break;
    }
    return eventClass;
  }

  // 댓글 등록시 태깅 분기
  void tagToAdd() {
    final state = BlocProvider.of<TagCommentBloc>(context).state;

    if (state is TaggingState) {
      // state.targetNick 접근하기위한 조건문
      targetNick.sink.add(state.targetNick);
    } else if (state is ReCommentTaggingState) {
      // reCommentTargetNick = state.reCommentTarget;
      reCommentTargetNick.sink.add(state.reCommentTarget);
    }
  }

  // 댓글 답글 클릭시 태깅 분기
  void tagToRecomment() {
    final state = BlocProvider.of<TagCommentBloc>(context).state;

    if (state is TaggingState) {
      nickTagged.sink.add(state.targetNick);
    } else if (state is ReCommentTaggingState) {
      nickTagged.sink.add(state.reCommentTarget);
    }
  }

  void initionalizeEditPost(AppPost post) {
    final _imgBloc = BlocProvider.of<ImageBloc>(context);

    if (post.imgDownload!.isEmpty) {
      // print('imgDownload 가 is Empoty 일때 출력 >>');
      _imgBloc.add(InitialCamera());
      imgPathSub.sink.add("");
    } else {
      // 비어있지 않을 때
      // print('else 일때 post deletepath >> ' + post!.deleteImgPath.toString());
      _imgBloc.add(EditPostImg(
          imgPath: post.imgDownload, deleteImgPath: post.deleteImgPath));
      imgPathSub.sink.add(post.imgDownload);
    }
  }

  void handleImgPath(AppPost post) {
    final state = BlocProvider.of<ImageBloc>(context).state;
    // 이미지 로드가 성공
    if (state is ImagePickerSuccess) {
      if (post.imgDownload!.length > 6) {
        // 경우의 수
        // 1. 있던 사진을 교체하는 경우
        // 2.
        imgPathSub.sink.add(state.imgDownload);
        deletePathSub.sink.add(post.deleteImgPath);
      } else {
        // 사진이 없는데 사진을 추가하는 경우
        imgPathSub.sink.add(state.imgDownload);
        deletePathSub.sink.add(state.deleteImgPath);
      }
    } else if (state is EditImg) {
      if (post.imgDownload!.length > 6) {
        // 경우의수
        // 1.이미 있는 사진을 조작없이 그대로 두는 경우 (글내용만 수정)
        // 이미 이미지가 있어서 그대로 둘경우 img 에 주소할당 안함
        deletePathSub.sink.add(post.deleteImgPath);
      } else {
        imgPathSub.sink.add(state.imgDownload);
        deletePathSub.sink.add(state.deleteImgPath);
      }
    }
  }
}
