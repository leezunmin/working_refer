import 'package:application/blocs/blocs.dart';
import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:application/utils/utils.dart';
import 'package:application/views/community/widgets/custom_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

enum ModelTypeEnum { appVote, voteItem, listVoteItem }

enum BlocEventEnum { addPost, addPostVoted, editPost, addComment, addRecomment }

mixin ValidatorMixin<T extends StatefulWidget> on State<T> {
  bool validateIsOk = true;

  late final AuthStateService _authStateService;
  late final VoteBloc _voteBloc;
  late final PostBloc _getBloc;
  late final ImageBloc _imgBloc;
  // final bool imgProgress = false;

  @override
  void initState() {
    L.instance.info(this, 'ValidatorMixin initState >>>');

    super.initState();

    _voteBloc = BlocProvider.of<VoteBloc>(context);
    _getBloc = BlocProvider.of<PostBloc>(context);
    _imgBloc = BlocProvider.of<ImageBloc>(context);
    _authStateService = context.read<AuthStateService>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 이쪽에 먼저 오게된다
  baseValidator(AppCommunityEnum validateType,
      {AppPostHeaderEnum? currentHeader}) {
    VoteState voteState = BlocProvider.of<VoteBloc>(context).state;
    ImageBlocState imageState = BlocProvider.of<ImageBloc>(context).state;

    if (validateType == AppCommunityEnum.writeValidate) {
      switch (voteState.runtimeType) {
        // 투표창이 열려있을때의 검증
        case EditingVoteListState:
          return votePostValidate(currentHeader!);

        default:
          // 투표 첨부 없이 게시글만 있을때
          return postValidator(currentHeader!);
      }
    } else if (validateType == AppCommunityEnum.editValidate) {
      return postValidator(currentHeader!);
    }
  }

  bool validateCommentTxt(TextEditingController txt) {
    bool isOk = false;

    if (txt.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomPopDialog(cancle: false, title: Text("내용을 입력해주세요"));
          });
    } else if (txt.text.length >= 501) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomPopDialog(
                cancle: true,
                title: Text("글자초과"),
                content: Text("500자 이하로 입력해 주세요"));
          });
    } else {
      isOk = true;
    }
    return isOk;
  }

  bool votePostValidate(AppPostHeaderEnum _currentHeader) {
    // 투표포함된 검증 로직

    bool votePostValidate = false;

    AppVote? appVote = makeModelItemFromMap(ModelTypeEnum.appVote);

    List<AppVoteItem> voteList =
        makeModelItemFromMap(ModelTypeEnum.listVoteItem);

    /*AppVote? appVote =
        _blocRepository.makeModelItemFromMap(ModelTypeEnum.appVote);

    List<AppVoteItem> voteList =
        _blocRepository.makeModelItemFromMap(ModelTypeEnum.listVoteItem);*/

    if (validateVote(validateVoteTitle(appVote), validateItemArray(voteList))) {
      if (validateAnswerText(voteList)) {
        print('validateVoteText is true >>>');

        if (validatePostText(currentHeader: _currentHeader)) {
          print('validatePostTxt is true >>>');
          votePostValidate = true;
        }
      }
    }
    return votePostValidate;
  }

  bool validateVote(bool voteTitle, bool voteList) {
    bool validateResult = false;

    if (voteTitle && voteList) {
      validateResult = true;
    }
    return validateResult;
  }

  bool validateVoteTitle(AppVote? appVote) {
    bool isOk = false;
    if (appVote!.title.length == 0) {
      showAlertWidget(title: "투표 제목을 입력해 주세요.", cancle: false);
    } else if (appVote.title.length > 0) {
      isOk = true;
    }
    return isOk;
  }

  bool validateItemArray(List<AppVoteItem> voteList) {
    bool isOk = false;

    if ((0 < voteList.length)) {
      isOk = true;
    } else if (voteList.length == 0 || voteList.length < 2) {
      showAlertWidget(title: "최소 2개 이상의 투표 답변을 만들어주세요.", cancle: false);
    } else if (voteList.length > 10) {
      isOk = false;
      showAlertWidget(title: "답변은 10개까지만 추가할 수 있어요.", cancle: false);
    }
    return isOk;
  }

  // 투표 답변 내용 입력 검증
  bool validateAnswerText(List<AppVoteItem> voteList) {
    bool isOk = true;

    voteList.forEach((element) {
      if (element.text!.isEmpty) {
        isOk = false;
      } else {}
    });

    if (!isOk) {
      showAlertWidget(title: "답변을 채워주세요.", cancle: false);
    }
    return isOk;
  }

  bool postValidator(AppPostHeaderEnum _currentHeader) {
    bool postValidate = false;

    if (validatePostText(currentHeader: _currentHeader)) {
      postValidate = true;
    } else {}
    return postValidate;
  }

  bool validatePostText({AppPostHeaderEnum? currentHeader}) {
    bool isOk = true;
    String warningTxt = "";

    if (_getBloc.postBlocTitleSub.valueOrNull!.text.length == 0) {
      isOk = false;
      validateIsOk = false;
      warningTxt = "제목을 입력해주세요";
    } else if (_getBloc.postBlocContentSub.valueOrNull!.text.length == 0) {
      isOk = false;
      validateIsOk = false;
      warningTxt = "내용을 입력해주세요";
    }

    if (currentHeader == AppPostHeaderEnum.unknown ||
        currentHeader == AppPostHeaderEnum.all) {
      isOk = false;
      validateIsOk = false;
      warningTxt = "말머리를 선택해주세요";
    }

    if (!isOk) {
      showAlertWidget(title: warningTxt, cancle: false);
    }
    return isOk;
  }

  makeModelItemFromMap(ModelTypeEnum modelEnum,
      {param, AppPostHeaderEnum? currentHeader}) {
    dynamic modelObject = null;

    switch (modelEnum) {
      case ModelTypeEnum.appVote:
        AppVote? appVote = AppVote.fromMap({
          "title": _voteBloc.voteTitleSub.value.text,

          // "expireDate": timeMapToDateTime(DateTime.now().add(Duration(days: 1))),
          "expireDate": timeMapToDateTime(DateTime.now()
              .add(Duration(days: _voteBloc.voteDurationSub.value))),

          "isExpired": false,
          "voteCount": 0
        });
        modelObject = appVote;
        break;

      case ModelTypeEnum.voteItem:
        final VoteState voteState = _voteBloc.state;

        if (voteState is EditingVoteListState) {
          AppVoteItem voteItem = AppVoteItem.fromMap({
            "text": param.text,
            "id": voteState.controllerList!.indexOf(param).toString(),
            "count": 0,
            "percent": 0.00
          })!;

          modelObject = voteItem;
        }
        break;

      case ModelTypeEnum.listVoteItem:
        final VoteState voteState = _voteBloc.state;
        List<AppVoteItem> voteList = [];
        if (voteState is EditingVoteListState) {
          if (voteState.controllerList != null &&
              voteState.controllerList!.length >= 2) {
            voteState.controllerList!.forEach((element) {
              AppVoteItem voteItem =
                  makeModelItemFromMap(ModelTypeEnum.voteItem, param: element);
              voteList.add(voteItem);
            });
          }
          modelObject = voteList;
        }
        break;

      default:
        break;
    }
    return modelObject;
  }

  showAlertWidget({String? title, String? content, bool? cancle}) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomPopDialog(
            cancle: cancle,
            title: title == null ? Text('') : Text(title),
            content: content == null ? Text('') : Text(content),
          );
        });
  }
}
