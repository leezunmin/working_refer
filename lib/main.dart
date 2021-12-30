// import 'dart:async';
// import 'dart:isolate';

// import 'package:application/apis/apis.dart';
// import 'package:application/blocs/blocs.dart';
// import 'package:application/models/models.dart';
// import 'package:application/repositories/repository.dart';
// import 'package:application/routes/routes.dart';
// import 'package:application/services/services.dart';
// import 'package:application/styles/styles.dart';
// import 'package:application/views/views.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart' show kDebugMode;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'blocs/blocs.dart';
// import 'consts/consts.dart';

// void main() async {
//   Isolate.current.addErrorListener(RawReceivePort((pair) async {
//     final List<dynamic> errorAndStacktrace = pair;
//     await FirebaseCrashlytics.instance.recordError(
//       errorAndStacktrace.first,
//       errorAndStacktrace.last,
//     );
//   }).sendPort);

//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   Environment setupEnv(String projectId, {bool useEmulator = false}) {
//     switch (projectId) {
//     삭제
//     }
//   }

//   runZonedGuarded<Future<void>>(() async {
//     runApp(
//      삭제

//         삭제
//         },
//       ),
//     );
//   }, (Object error, StackTrace stackTrace) {
//     FirebaseCrashlytics.instance.recordError(error, stackTrace);
//   });
// }

// class GlobalDependencyInjector extends StatelessWidget {
//   const GlobalDependencyInjector({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final env = context.watch<Environment>();
//     final l = L.instance;

//     l.info(this, 'firebase env: ${env.firebaseEnv}');

//     return MultiProvider(providers: [
//       Provider<FirebaseAnalytics>(
//           lazy: false, create: (_) => FirebaseAnalytics.instance),
//       Provider<RemoteConfigApi>(
//           lazy: false, create: (_) => RemoteConfigApi(RemoteConfig.instance)),
//       Consumer<RemoteConfigApi>(
//        삭제
//       ),
//       Provider<AuthService>(
//         lazy: false,
//         dispose: (_, service) => service.dispose(),
//         create: (_) => AuthService(
//           firebaseAuth: FirebaseAuth.instance,
//         ),
//       ),
//       Provider<NavigationService>(
//         lazy: false,
//         dispose: (_, service) => service.dispose(),
//         create: (_) => NavigationService(),
//       ),
//       Provider<ThemeService>(
//         lazy: false,
//         dispose: (_, service) => service.dispose(),
//         create: (_) => ThemeService(),
//       ),
//       Provider<ConnectivityService>(
//         lazy: false,
//         dispose: (_, service) => service.dispose(),
//         create: (_) => ConnectivityService(),
//       ),
//       Provider<PermissionService>(
//           lazy: false, create: (_) => PermissionService()),
//       Consumer<AuthService>(
//         builder: (_, authService, child) => Provider(
//           lazy: false,
//           create: (_) => AppApi(authService),
//           child: child,
//         ),
//       ),
//       Consumer<SharedPrefsApi>(
//        삭제
//       ),
//       Consumer<Repository>(
//        삭제
//       ),
//       Consumer<AuthService>(
//         삭제
//       Consumer<AuthService>(
//         삭제
//      삭제
//       Consumer<Repository>(
//           builder: (_, repo, repoChild) => MultiBlocProvider(
//                 providers: [
//                   BlocProvider<PostBloc>(
//                     create: (BuildContext context) => PostBloc(
//                         initialState: const GetInit(postList: []),
//                         repository: repo)
//                       ..add(InitialOnce()),
//                   ),
//                 ],
//                 child: const MyApp(),
//               )),
//     ], child: const MyApp());
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with AppStatefulViewMixin {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     initializeDateFormatting();
//     return OverlaySupport.global(
//         child: StreamBuilder<AppTheme>(
//            삭제
//             }));
//   }
// }
