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
//       case firebaseProdProjectId:
//         return Environment(FirebaseEnv.prod, useEmulator: useEmulator);
//       case firebaseDevProjectId:
//         return Environment(FirebaseEnv.dev, useEmulator: useEmulator);
//       default:
//         throw ArgumentError();
//     }
//   }

//   runZonedGuarded<Future<void>>(() async {
//     runApp(
//       FutureBuilder<List<Object>>(
//         future: Future.wait([
//           Firebase.initializeApp(),
//           SharedPreferences.getInstance(),
//         ]).then((rs) async {
//           final firebaseApp = rs[0] as FirebaseApp;
//           // final sharedPrefs = rs[1] as SharedPreferences;
//           final env = setupEnv(
//             firebaseApp.options.projectId,
//             // useEmulator: true,
//             // devUrls: sFbDevUrls,
//           );
//           final remoteConfig = RemoteConfig.instance;
//           final l = L.instance;

//           // 프로덕션이면서 디버그 모드
//           if (kDebugMode && env.firebaseEnv == FirebaseEnv.prod) {
//             await FirebaseCrashlytics.instance
//                 .setCrashlyticsCollectionEnabled(false);

//             // Enable developer mode to relax fetch throttling
//             remoteConfig.setConfigSettings(RemoteConfigSettings(
//                 fetchTimeout: const Duration(),
//                 minimumFetchInterval: const Duration()));
//           } else {
//             FlutterError.onError =
//                 FirebaseCrashlytics.instance.recordFlutterError;
//           }

//           try {
//             // Using default duration to force fetching from remote server.
//             await remoteConfig.fetchAndActivate();
//           } catch (exception) {
//             l.info('main',
//                 'runApp: remoteConfig: Unable to fetch. Cached or default values will be used');
//             // rethrow;
//           }

//           return [...rs, env];
//         }),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             throw snapshot.error!;
//           }
//           if (snapshot.hasData) {
//             FirebaseApp firebaseApp = snapshot.data![0] as FirebaseApp;
//             SharedPreferences prefs = snapshot.data![1] as SharedPreferences;
//             Environment env = snapshot.data![2] as Environment;

//             return MultiProvider(
//               providers: [
//                 Provider<FirebaseApp>.value(value: firebaseApp),
//                 Provider<Environment>.value(value: env),
//                 Provider<SharedPrefsApi>(
//                     create: (_) => SharedPrefsApi(prefs), lazy: false),
//               ],
//               child: const GlobalDependencyInjector(),
//             );
//           } else {
//             return Container();
//           }
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
//         builder: (_, remoteConfigApi, child) => Provider<UpdateService>(
//             lazy: false,
//             dispose: (_, service) => service.dispose(),
//             create: (_) => UpdateService(
//                 remoteConfigApi, Provider.of<Environment>(context)),
//             child: child),
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
//         builder: (_, sharedPrefsApi, child) => Consumer<AuthService>(
//             builder: (_, authService, authConsumerChild) => Consumer<AppApi>(
//                 builder: (_, appApi, appApiConsumerChild) =>
//                     Provider<Repository>(
//                         lazy: false,
//                         create: (_) => Repository(
//                             environment: env,
//                             sharedPrefsApi: sharedPrefsApi,
//                             authBloc: authService,
//                             firestoreApi: FirestoreApi(
//                                 authService, FirebaseFirestore.instance),
//                             functionsApi: FunctionsApi(
//                                 FirebaseFunctions.instanceFor(
//                                     region: 'asia-northeast3')),
//                             cloudStorageApi:
//                                 CloudStorageApi(FirebaseStorage.instance),
//                             purchaseApi: PurchaseProductsApi(env),
//                             kakaoRestApi: KakaoRestApi(),
//                             instaRestApi: InstagramRestApi(),
//                             appServiceApi: AppServiceApi(env, authService)),
//                         child: appApiConsumerChild),
//                 child: authConsumerChild),
//             child: child),
//       ),
//       Consumer<Repository>(
//         builder: (_, repo, repoChild) => Consumer<NavigationService>(
//           builder: (_, navigatorKey, navigatorKeyChild) =>
//               Provider<PushNotiService>(
//                   dispose: (_, service) => service.dispose(),
//                   lazy: false,
//                   child: navigatorKeyChild,
//                   create: (_) => PushNotiService(
//                       FirebaseMessaging.instance, repo, navigatorKey)),
//           child: repoChild,
//         ),
//       ),
//       Consumer<AuthService>(
//           builder: (_, authService, child) => Consumer<Repository>(
//               builder: (_, repo, repoChild) => Consumer<NavigationService>(
//                   builder: (_, navigatorKey, navigatorKeyChild) =>
//                       Consumer<PushNotiService>(
//                           builder: (_, msgSvc, msgSvcChild) =>
//                               Provider<AuthStateService>(
//                                   lazy: false,
//                                   dispose: (_, service) => service.dispose(),
//                                   create: (_) => AuthStateService(
//                                         auth: authService,
//                                         crashlytics:
//                                             FirebaseCrashlytics.instance,
//                                         firebaseAuth: FirebaseAuth.instance,
//                                         googleSignIn: GoogleSignIn(),
//                                         navi: navigatorKey,
//                                         pushNoti: msgSvc,
//                                         repo: repo,
//                                       ),
//                                   child: msgSvcChild),
//                           child: navigatorKeyChild),
//                   child: repoChild),
//               child: child)),
//       Consumer<AuthService>(
//           builder: (_, authService, child) => Consumer<AuthStateService>(
//                 builder: (_, authState, aschild) => Consumer<Repository>(
//                     builder: (_, repo, repoChild) => Provider<PurchaseBloc>(
//                           lazy: false,
//                           create: (_) =>
//                               PurchaseBloc(repo, authService, authState),
//                           dispose: (_, service) => service.dispose(),
//                           child: repoChild,
//                         ),
//                     child: aschild),
//                 child: child,
//               )),
//       Consumer<AuthStateService>(
//           builder: (_, authState, child) => Consumer<Repository>(
//               builder: (_, repo, repoChild) => Provider<MembershipBloc>(
//                     lazy: false,
//                     dispose: (_, service) => service.dispose(),
//                     create: (_) =>
//                         MembershipBloc(repo: repo, authState: authState),
//                     child: repoChild,
//                   ),
//               child: child)),
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
//             stream: themes.appTheme,
//             initialData: AppTheme.light,
//             builder: (context, snapshot) {
//               final myAppTheme = snapshot.data!;

//               return MaterialApp(
//                 builder: (context, child) {
//                   return MediaQuery(
//                     data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
//                     child: child!,
//                   );
//                 },

//                 // title: 'Flutter Demo',
//                 navigatorObservers: [
//                   navi.rootObserver,
//                 ],
//                 localizationsDelegates: const [
//                   // GlobalCupertinoLocalizations.delegate,
//                 ],
//                 // home: ScreensScreen(),
//                 routes: homeRoutes,
//                 navigatorKey: navi.rootKey,
//                 themeMode: myAppTheme.mode,
//                 theme: AppTheme.light.spec,
//                 darkTheme: AppTheme.dark.spec,
//               );
//             }));
//   }
// }
