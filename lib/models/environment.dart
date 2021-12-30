import 'package:application/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum FirebaseEnv { prod, dev }
enum ExchangeEnv { prod, dev }
enum ServiceEnv { prod, dev }
enum AppEnv { prod, dev }

class Environment {
  final FirebaseEnv firebaseEnv;
  late ExchangeEnv? exchangeEnv;
  late ServiceEnv? serviceEnv;
  late AppEnv? appEnv;
  final bool useEmulator;
  final String fbDevUrl;
  final int fbAuthPort;
  final int fbFirestorePort;
  final int fbFnsPort;

  bool get isProdService => serviceEnv != ServiceEnv.dev;
  bool get isProdExchange => exchangeEnv != ExchangeEnv.dev;
  bool get isProdApp => appEnv != AppEnv.dev;

  get serviceServerUrl => isProdService
      ? "https://service-dot-bemy-prod.du.r.appspot.com"
      : "https://service-dot-bemy-dev.du.r.appspot.com";
  // get serviceServerUrl => "http://220.76.182.88:8080";
  get exchangeServerUrl => isProdExchange
      ? "https://bemy-prod.du.r.appspot.com"
      : "https://bemy-dev.du.r.appspot.com";
  // get exchangServerUrl => 'http://175.198.52.113:8080';
  // get exchangServerUrl => "http://service.angry-radish.com";

  // get exchangServerUrl {
  //     return firebaseEnv == FirebaseEnv.prod
  //         ? prodExchangeServerUrl
  //         : firebaseEnv == FirebaseEnv.stag
  //             ? stagExchangeServerUrl
  //             : firebaseEnv == FirebaseEnv.dev
  //                 ? devExchangeServerUrl
  //                 : null;
  // }

  // get appServerUrl {
  //     return firebaseEnv == FirebaseEnv.prod
  //         ? prodAppServerUrl
  //         : firebaseEnv == FirebaseEnv.stag
  //             ? stagAppServerUrl
  //             : firebaseEnv == FirebaseEnv.dev
  //                 ? devAppServerUrl
  //                 : null;
  // }

  get imageCdnUrl {
    return firebaseEnv == FirebaseEnv.prod
        ? imgixProdUrl
        : firebaseEnv == FirebaseEnv.dev
            ? imgixDevUrl
            : null;
  }

  Environment(
    this.firebaseEnv, {
    this.exchangeEnv,
    this.serviceEnv,
    this.appEnv,
    this.useEmulator = false,
    this.fbDevUrl = defaultFbDevUrl,
    this.fbAuthPort = defaultFbAuthPort,
    this.fbFirestorePort = defaultFbFirestorePort,
    this.fbFnsPort = defaultFbFnsPort,
  }) {
    appEnv ??= firebaseEnv == FirebaseEnv.prod ? AppEnv.prod : AppEnv.dev;

    exchangeEnv ??=
        firebaseEnv == FirebaseEnv.prod ? ExchangeEnv.prod : ExchangeEnv.dev;

    serviceEnv ??=
        firebaseEnv == FirebaseEnv.prod ? ServiceEnv.prod : ServiceEnv.dev;
    configDevEnv();
  }

  void configDevEnv() {
    // 빌드할때 값을 전달 받으면
    if (kUseDefaultDev) {
      FirebaseFirestore.instance
          .useFirestoreEmulator(fbDevUrl, defaultFbFirestorePort);
      FirebaseAuth.instance.useAuthEmulator(fbDevUrl, defaultFbAuthPort);
      FirebaseFunctions.instanceFor(region: 'asia-northeast3')
          .useFunctionsEmulator(defaultFbDevUrl, defaultFbFnsPort);
      return;
    } else if (useEmulator) {
      FirebaseFirestore.instance.useFirestoreEmulator(fbDevUrl, fbAuthPort);
      FirebaseAuth.instance.useAuthEmulator(fbDevUrl, fbAuthPort);
      FirebaseFunctions.instanceFor(region: 'asia-northeast3')
          .useFunctionsEmulator(fbDevUrl, fbFnsPort);
      return;
    }
  }
}
