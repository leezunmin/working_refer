// import 'package:application/routes/routes.dart';
// import 'package:application/services/services.dart';
// import 'package:application/views/views.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CommunityNavigator extends StatefulWidget {
//   static const routeName = '/community';

//   final GlobalKey<NavigatorState> naviKey;


//   const CommunityNavigator(this.naviKey, {Key? key}) : super(key: key);

//   @override
//   _CommunityNavigatorState createState() => _CommunityNavigatorState();
// }

// class _CommunityNavigatorState extends State<CommunityNavigator>
//     with AppStatefulViewMixin {

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance!.addPostFrameCallback(
//         (_) => navi.setAppNavigator(AppNavigators.community));

//     l.info(this, '_CommunityNavigatorState build() ');
//     return Navigator(
//         key: widget.naviKey,
//         initialRoute: CommunityMainScreen.routeName,
//         onPopPage: (r, _) {
//           return true;
//         },
//         observers: [
//           context.watch<NavigationService>().communityObserver,
//         ],
//         onGenerateInitialRoutes: (navigator, initialRoute) {
//           return [
//             MaterialPageRoute(builder: (BuildContext context) {
//               return communityRoutes[CommunityMainScreen.routeName]!(context);
//             })
//           ];
//         },
//         onGenerateRoute: (settings) {
//           return MaterialPageRoute(
//               settings: settings,
//               builder: (BuildContext context) {
//                 return communityRoutes[settings.name!]!(context);
//               });
//         });
//   }
// }
