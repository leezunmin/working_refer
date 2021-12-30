import 'package:application/apis/apis.dart';
import 'package:application/blocs/blocs.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';

import '../views.dart';

enum ViewState {
  init,
  busy,
  idle,
  error,
}

mixin AppStatefulViewMixin<T extends StatefulWidget> on State<T> {
  final _viewState = BehaviorSubject<ViewState>.seeded(ViewState.init);
  late LogService l = L.instance;

  late FirebaseCrashlytics crash = FirebaseCrashlytics.instance;
  late Repository repo;
  late AuthStateService authState;
  late NavigationService navi;
  late Environment env;
  late RemoteConfigApi remote;
  late FirebaseAnalytics analytics;
  late PushNotiService pushNoti;
  late ConnectivityService conn;
  late ThemeService themes;
  late UpdateService update;
  late PurchaseBloc purchase;
  late PermissionService perm;

  AppUserProfile? get currentMyUserProfile => authState.currentMe?.profile;
  Me? get currentMe => authState.currentMe;
  String? get currentMyUserId => authState.currentUserId;

  AppTheme get currentAppTheme => themes.currentAppTheme;
  ThemeData get currentThemeData => themes.currentThemeData;
  ThemeData get lightThemeData => AppTheme.light.spec;
  ThemeData get darkThemeData => AppTheme.dark.spec;
  bool get isDark => themes.isDark;
  bool get isLight => themes.isLight;

  Function(ViewState) get setViewState => _viewState.add;
  ViewState get currentViewState => _viewState.value;
  Stream<ViewState> get viewState => _viewState.stream.distinct();
  bool get isBusy => currentViewState == ViewState.busy;

  NavigatorState get rootNavi => navi.rootNavigator;

  @override
  void initState() {
    super.initState();
    repo = context.read<Repository>();
    perm = context.read<PermissionService>();
    authState = context.read<AuthStateService>();
    navi = context.read<NavigationService>();
    env = context.read<Environment>();
    remote = context.read<RemoteConfigApi>();
    analytics = context.read<FirebaseAnalytics>();
    pushNoti = context.read<PushNotiService>();
    conn = context.read<ConnectivityService>();
    themes = context.read<ThemeService>();
    update = context.read<UpdateService>();
    purchase = context.read<PurchaseBloc>();
  }

  @override
  void dispose() {
    _viewState.close();
    super.dispose();
  }

  Future<void> showBlockMessageBar() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('차단된 사용자입니다.', textAlign: TextAlign.center),
      duration: Duration(seconds: 1),
    ));
  }

  Future<void> goToMeetDetailScreen(
      {required NavigatorState navigator,
      required AppMeet meet,
      String? teamId,
      bool isInviteMode = false}) async {
    repo.checkAvalableUser(meet.owner!).then((aval) {
      if (aval) {
        navigator.pushNamed(MeetDetailScreen.routeName,
            arguments: MeetDetailScreenArgs(meet,
                isInviteMode: isInviteMode, teamId: teamId));
      } else {
        showBlockMessageBar();
      }
    });
  }

  Future<void> goToProfileScreen(
      {required NavigatorState navigator,
      required String userId,
      bool likeAble = false,
      AppUserProfile? defaultProfile}) async {
    repo.checkAvalableUser(userId).then((aval) {
      if (aval) {
        navigator.pushNamed(ProfileScreen.routeName,
            arguments: ProfileScreenArgs(userId,
                likeAble: likeAble, defaultProfile: defaultProfile));
      } else {
        showBlockMessageBar();
      }
    });
  }

  Future<void> goToCommunotyReaderScreen({
    required NavigatorState navigator,
    required AppPost post,
  }) async {
    repo.checkAvalableUser(post.ownerId).then((aval) {
      if (aval) {
        // navigator.pushNamed(CommunotyReaderScreen.routeName, arguments: post);
        navigator.push((MaterialPageRoute(
            builder: (context) => Provider?.value(
                  value: navigator,
                  builder: (context, child) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<ImageBloc>(
                          create: (BuildContext context) => ImageBloc(repo),
                        ),
                        BlocProvider<CommentBloc>(
                          // lazy: true,
                          create: (BuildContext context) => CommentBloc(repo),
                        ),
                        BlocProvider<TagCommentBloc>(
                          // lazy: true,
                          create: (BuildContext context) => TagCommentBloc(),
                        ),
                        BlocProvider<LikePostBloc>(
                          // lazy: true,
                          create: (BuildContext context) => LikePostBloc(repo),
                        ),
                        BlocProvider<VoteBloc>(
                          create: (BuildContext context) => VoteBloc(repo),
                        ),
                        BlocProvider<CommentImageBloc>(
                          create: (BuildContext context) =>
                              CommentImageBloc(repo),
                        )
                      ],
                      child: CommunityReaderScreen(post),
                    );
                  },
                ))));
      } else {
        showBlockMessageBar();
      }
    });
  }

  Future<void> goToMessageDetailScreen({
    required NavigatorState navigator,
    required String userId,
    required AppChatRoom? room,
  }) async {
    repo.checkAvalableUser(userId).then((aval) {
      if (aval) {
        navigator.pushNamed(MessageDetailScreen.routeName, arguments: room);
      } else {
        showBlockMessageBar();
      }
    });
  }
}
