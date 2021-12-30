import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:application/views/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> _routes = {
  HomeScreen.routeName: (context) {
    return const HomeScreen();
  },
  AuthScreen.routeName: (context) => const AuthScreen(),
  InstaScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as InstaScreenArgs;
    return InstaScreen(args);
  },
  SignupScreen.routeName: (context) => const SignupScreen(),
  VerifyEmailScreen.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PhoneAuthCredential?;
    return VerifyEmailScreen(args);
  },
  WellcomScreen.routeName: (context) => const WellcomScreen(),
  ProfileWriteScreen.routeName: (context) => const ProfileWriteScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  LoginAppleScreen.routeName: (context) => const LoginAppleScreen(),
  LoginGoogleScreen.routeName: (context) => const LoginGoogleScreen(),
  LoginFacebookScreen.routeName: (context) => const LoginFacebookScreen(),
  LoginPhoneScreen.routeName: (context) => const LoginPhoneScreen(),
  LoginEmailScreen.routeName: (context) => const LoginEmailScreen(),
  SettingsGenderScreen.routeName: (context) => const SettingsGenderScreen(),
  MembershipIntroScreen.routeName: (context) => const MembershipIntroScreen(),
  LoginEmailVerifyScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return LoginEmailVerifyScreen(args);
  },
  // MyPageNavigator.routeName: (context) => MyPageNavigator(),
  MyPageScreen.routeName: (context) => const MyPageScreen(),
  ProfileCertificationScreen.routeName: (context) =>
      const ProfileCertificationScreen(),
  ProfileCertificationCaptureScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;

    L.instance.info(
        'route', 'routes: ProfileCertificationCaptureScreen: args: $args');
    return ProfileCertificationCaptureScreen(poseUrl: args);
  },
  ProfileCertificationGuideScreen.routeName: (context) =>
      const ProfileCertificationGuideScreen(),
  ProfileCertificationConfirmScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ProfileCertificationConfirmScreenArgs;
    return ProfileCertificationConfirmScreen(
        poseUrl: args.poseUrl, localCache: args.localCache);
  },

  MatchScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppLike?;
    return MatchScreen(args);
  },
  SettingsPrivateScreen.routeName: (context) => const SettingsPrivateScreen(),
  SettingsLocationTermScreen.routeName: (context) =>
      const SettingsLocationTermScreen(),
  SettingsServiceTermScreen.routeName: (context) =>
      const SettingsServiceTermScreen(),

  StarPointOrderScreen.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as AppMembershipEnum;
    // return StarPointOrder(args);
    return StarPointOrderScreen(fallbackMembership: args);
  },
  StarPointQuestionScreen.routeName: (context) =>
      const StarPointQuestionScreen(),
  StarPointHistoryScreen.routeName: (context) => const StarPointHistoryScreen(),
  ProfileMyMeetingMoreScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    return ProfileMyMeetingMoreScreen(
        args[0] as List<AppMeet?>, args[1] as bool);
  },

  ProfileEditScreen.routeName: (context) => const ProfileEditScreen(),

  ProfileMyMeetingScreen.routeName: (context) => const ProfileMyMeetingScreen(),

  ProfileCommunityScreen.routeName: (context) => const ProfileCommunityScreen(),
  ProfileLikeScreen.routeName: (context) => const ProfileLikeScreen(),
  ProfileEditSchoolScreen.routeName: (context) =>
      const ProfileEditSchoolScreen(),
  ProfileEditCompanyScreen.routeName: (context) =>
      const ProfileEditCompanyScreen(),
  ProfileEditLocalScreen.routeName: (context) => const ProfileEditLocalScreen(),
  SettingsMainScreen.routeName: (context) => const SettingsMainScreen(),
  SettingsPhoneScreen.routeName: (context) => const SettingsPhoneScreen(),
  SettingsLoginScreen.routeName: (context) => const SettingsLoginScreen(),
  SettingsBlinderScreen.routeName: (context) => const SettingsBlinderScreen(),
  SettingsDeleteAccountScreen.routeName: (context) =>
      const SettingsDeleteAccountScreen(),
  SettingsEtcPushScreen.routeName: (context) => const SettingsEtcPushScreen(),
  SettingsFaqScreen.routeName: (context) => const SettingsFaqScreen(),
  SettingsPushScreen.routeName: (context) => const SettingsPushScreen(),
  SettingsQnaScreen.routeName: (context) => const SettingsQnaScreen(),
  NotiScreen.routeName: (context) => const NotiScreen(),
  SettingsBlinderDetailScreen.routeName: (context) =>
      const SettingsBlinderDetailScreen(),
  SettingsEmailScreen.routeName: (context) => const SettingsEmailScreen(),
  SettingsDeleteAccountResonScreen.routeName: (context) =>
      const SettingsDeleteAccountResonScreen(),
  SettingsDeleteAccountCoupleScreen.routeName: (context) =>
      const SettingsDeleteAccountCoupleScreen(),
  SettingsDeleteAccountFeedbackScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as SettingsDeleteAccountFeedbackScreenArgs;
    return SettingsDeleteAccountFeedbackScreen(
        title: args.title, desc: args.desc);
  },
  MeetMemberMoreScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final meet = args[0] as AppMeet;
    final title = args[1] as String;
    final mems = args[2] as List<ExTeamOrMember>;

    return MeetMemberMoreScreen(
      meet,
      title: title,
      members: mems,
    );
  },
  MeetFindUserScreen.routeName: (context) => const MeetFindUserScreen(),

  ProfileMyMeetingAwayTeamScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppMeet?;
    return ProfileMyMeetingAwayTeamScreen(args);
  },
  ProfileMyMeetingHomeTeamScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppMeet?;
    return ProfileMyMeetingHomeTeamScreen(args);
  },
  ProfileMyMeetingSignedUserScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final meet = args[0] as AppMeet;
    final member = args[1] as AppMeetMember;
    final mode = args[2] as bool;
    return ProfileMyMeetingSignedUserScreen(
      meet,
      member,
      isTeamMode: mode,
    );
  },
  ProfileMyMeetingInvitedUserScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final meet = args[0] as AppMeet;
    final mode = args[1] as bool;
    return ProfileMyMeetingInvitedUserScreen(
      meet,
      isTeamMode: mode,
    );
  },
  ProfileMyMeetingNoneTeamScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppMeet;
    return ProfileMyMeetingNoneTeamScreen(args);
  },
  MeetsMainScreen.routeName: (context) => const MeetsMainScreen(),
  MeetMoreScreen.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MeetMoreScreenArgs?;
    return MeetMoreScreen(
      args: args,
    );
  },
  MessageMainScreen.routeName: (context) => const MessageMainScreen(),
  MessageSearchScreen.routeName: (context) => const MessageSearchScreen(),
  CommunityMainScreen.routeName: (context) => const CommunityMainScreen(),
  CommunitySearchScreen.routeName: (context) => const CommunitySearchScreen(),
  CommunityWriteScreen.routeName: (context) => const CommunityWriteScreen(),
  CommunityReaderScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppPost?;
    return CommunityReaderScreen(args);
  },
  // CommunotyModifyScreen.routeName: (context) => CommunotyModifyScreen(),
  CommunityModifyScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppPost;
    return CommunityModifyScreen(args);
  },
  FriendRecommendationScreen.routeName: (context) =>
      const FriendRecommendationScreen(),
  ProfileScreen.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProfileScreenArgs?;
    if (args == null) throw ArgumentError();
    return ProfileScreen(
      args.userId,
      likeAble: args.likeAble,
      defaultProfile: args.defaultProfile,
    );
  },
  MeetDetailScreen.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MeetDetailScreenArgs?;
    if (args == null) throw ArgumentError();
    return MeetDetailScreen(
      args.meet,
      teamId: args.teamId,
      isInviteMode: args.isInviteMode,
      wantKeepAlive: args.wantKeepAlive,
    );
  },
  MeetGuideScreen.routeName: (context) {
    final isMeetingMode = ModalRoute.of(context)!.settings.arguments as bool?;
    return MeetGuideScreen(
      isMeetingMode: isMeetingMode ?? false,
    );
  },
  MessageDetailScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppChatRoom?;
    return MessageDetailScreen(args);
  },
  MeetWriteScreen.routeName: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MeetWriteScreenArgs?;
    if (args == null) {
      return const MeetWriteScreen();
    } else {
      return MeetWriteScreen(meet: args.meet, isEditMode: args.isEditMode);
    }
  },
  MeetSearchScreen.routeName: (context) => const MeetSearchScreen(),
  MembershipFriendScreen.routeName: (context) => const MembershipFriendScreen(),
  MembershipFriend2Screen.routeName: (context) =>
      const MembershipFriend2Screen(),
  MembershipMemberScreen.routeName: (context) => const MembershipMemberScreen(),
  MembershipEverythingScreen.routeName: (context) =>
      const MembershipEverythingScreen(),
  AppTextContentScreen.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List?;
    if (args == null || args.length != 2) throw ArgumentError();
    final title = args[0] as String;
    final content = args[1] as String;
    return AppTextContentScreen(title, content);
  },
  UpdateScreen.routeName: (context) => const UpdateScreen(),
  InstaAuthScreen.routeName: (context) => const InstaAuthScreen(),
};

Map<String, Widget Function(BuildContext)> homeRoutes = {
  '/': (context) => const RootScreen(),
  ..._routes,
};

Map<String, Widget Function(BuildContext)> myPageRoutes = {
  '/': (context) => const MyPageScreen(),
  '/mypage': (context) => const MyPageScreen(),
  ..._routes,
};

Map<String, Widget Function(BuildContext)> meetsRoutes = {
  '/': (context) => const MeetsMainScreen(),
  '/meet': (context) => const MeetsMainScreen(),
  ..._routes,
};

Map<String, Widget Function(BuildContext)> messageRoutes = {
  '/': (context) => const MessageMainScreen(),
  '/message': (context) => const MessageMainScreen(),
  ..._routes,
};

Map<String, Widget Function(BuildContext)> communityRoutes = {
  '/': (context) => const CommunityMainScreen(),
  '/community': (context) => const CommunityMainScreen(),
  ..._routes,
};

Map<String, Widget Function(BuildContext)> findFriendRoutes = {
  '/': (context) => const FriendRecommendationScreen(),
  '/find_friends': (context) => const FriendRecommendationScreen(),
  ..._routes,
};
