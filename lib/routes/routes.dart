import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:application/views/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> _routes = {
  // HomeScreen.routeName: (context) {
  //   return const HomeScreen();
  // },
  // AuthScreen.routeName: (context) => const AuthScreen(),
  // InstaScreen.routeName: (context) {
  //   final args = ModalRoute.of(context)!.settings.arguments as InstaScreenArgs;
  //   return InstaScreen(args);
  // },
  // SignupScreen.routeName: (context) => const SignupScreen(),
  // VerifyEmailScreen.routeName: (context) {
  //   final args =
  //       ModalRoute.of(context)!.settings.arguments as PhoneAuthCredential?;
  //   return VerifyEmailScreen(args);
  // },
 

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
//   FriendRecommendationScreen.routeName: (context) =>
//       const FriendRecommendationScreen(),
//   ProfileScreen.routeName: (context) {
//     final args =
//         ModalRoute.of(context)!.settings.arguments as ProfileScreenArgs?;
//     if (args == null) throw ArgumentError();
//     return ProfileScreen(
//       args.userId,
//       likeAble: args.likeAble,
//       defaultProfile: args.defaultProfile,
//     );
//   },
//   MeetDetailScreen.routeName: (context) {
//     final args =
//         ModalRoute.of(context)!.settings.arguments as MeetDetailScreenArgs?;
//     if (args == null) throw ArgumentError();
//     return MeetDetailScreen(
//       args.meet,
//       teamId: args.teamId,
//       isInviteMode: args.isInviteMode,
//       wantKeepAlive: args.wantKeepAlive,
//     );
//   },
//   MeetGuideScreen.routeName: (context) {
//     final isMeetingMode = ModalRoute.of(context)!.settings.arguments as bool?;
//     return MeetGuideScreen(
//       isMeetingMode: isMeetingMode ?? false,
//     );
//   },
//   MessageDetailScreen.routeName: (context) {
//     final args = ModalRoute.of(context)!.settings.arguments as AppChatRoom?;
//     return MessageDetailScreen(args);
//   },
//   MeetWriteScreen.routeName: (context) {
//     final args =
//         ModalRoute.of(context)!.settings.arguments as MeetWriteScreenArgs?;
//     if (args == null) {
//       return const MeetWriteScreen();
//     } else {
//       return MeetWriteScreen(meet: args.meet, isEditMode: args.isEditMode);
//     }
//   },
//   MeetSearchScreen.routeName: (context) => const MeetSearchScreen(),
//   MembershipFriendScreen.routeName: (context) => const MembershipFriendScreen(),
//   MembershipFriend2Screen.routeName: (context) =>
//       const MembershipFriend2Screen(),
//   MembershipMemberScreen.routeName: (context) => const MembershipMemberScreen(),
//   MembershipEverythingScreen.routeName: (context) =>
//       const MembershipEverythingScreen(),
//   AppTextContentScreen.routeName: (context) {
//     final args = ModalRoute.of(context)!.settings.arguments as List?;
//     if (args == null || args.length != 2) throw ArgumentError();
//     final title = args[0] as String;
//     final content = args[1] as String;
//     return AppTextContentScreen(title, content);
//   },
//   UpdateScreen.routeName: (context) => const UpdateScreen(),
//   InstaAuthScreen.routeName: (context) => const InstaAuthScreen(),
// };

// Map<String, Widget Function(BuildContext)> homeRoutes = {
//   '/': (context) => const RootScreen(),
//   ..._routes,
// };

// Map<String, Widget Function(BuildContext)> myPageRoutes = {
//   '/': (context) => const MyPageScreen(),
//   '/mypage': (context) => const MyPageScreen(),
//   ..._routes,
// };

// Map<String, Widget Function(BuildContext)> meetsRoutes = {
//   '/': (context) => const MeetsMainScreen(),
//   '/meet': (context) => const MeetsMainScreen(),
//   ..._routes,
// };

// Map<String, Widget Function(BuildContext)> messageRoutes = {
//   '/': (context) => const MessageMainScreen(),
//   '/message': (context) => const MessageMainScreen(),
//   ..._routes,
// };

// Map<String, Widget Function(BuildContext)> communityRoutes = {
//   '/': (context) => const CommunityMainScreen(),
//   '/community': (context) => const CommunityMainScreen(),
//   ..._routes,
// };

// Map<String, Widget Function(BuildContext)> findFriendRoutes = {
//   '/': (context) => const FriendRecommendationScreen(),
//   '/find_friends': (context) => const FriendRecommendationScreen(),
//   ..._routes,
// };
