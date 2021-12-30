import 'package:application/apis/apis.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/cloud_storage_repository.dart';
import 'package:application/repositories/repositories.dart';
import 'package:application/repositories/service_repository.dart';
import 'package:application/services/services.dart';

abstract class BaseRepository with LogMixin {
  final Environment environment;
  final SharedPrefsApi sharedPrefsApi;
  final AuthService authBloc;
  final FirestoreApi firestoreApi;
  final FunctionsApi functionsApi;
  final CloudStorageApi cloudStorageApi;
  final PurchaseProductsApi purchaseApi;
  final KakaoRestApi kakaoRestApi;
  final InstagramRestApi instaRestApi;
  final AppServiceApi appServiceApi;

  BaseRepository({
    required this.environment,
    required this.sharedPrefsApi,
    required this.authBloc,
    required this.firestoreApi,
    required this.functionsApi,
    required this.cloudStorageApi,
    required this.purchaseApi,
    required this.kakaoRestApi,
    required this.instaRestApi,
    required this.appServiceApi,
  });
}

class Repository extends BaseRepository
    with
        SharedPrefsRepository,
        FirestoreRepositoryMixin,
        FunctionsRepositoryMixin,
        PurchaseRepositoryMixin,
        KakaoRestRepositoryMixin,
        InstaRestRepositoryMixin,
        AppServiceRepositoryMixin,
        CloudStorageRepository {
  @override
  final Environment environment;
  @override
  final SharedPrefsApi sharedPrefsApi;
  @override
  final AuthService authBloc;
  @override
  final FirestoreApi firestoreApi;
  @override
  final FunctionsApi functionsApi;
  @override
  final CloudStorageApi cloudStorageApi;
  @override
  final PurchaseProductsApi purchaseApi;
  @override
  final KakaoRestApi kakaoRestApi;
  @override
  final InstagramRestApi instaRestApi;
  @override
  final AppServiceApi appServiceApi;

  Repository({
    required this.environment,
    required this.sharedPrefsApi,
    required this.authBloc,
    required this.firestoreApi,
    required this.functionsApi,
    required this.cloudStorageApi,
    required this.purchaseApi,
    required this.kakaoRestApi,
    required this.instaRestApi,
    required this.appServiceApi,
  }) : super(
            environment: environment,
            sharedPrefsApi: sharedPrefsApi,
            authBloc: authBloc,
            firestoreApi: firestoreApi,
            functionsApi: functionsApi,
            cloudStorageApi: cloudStorageApi,
            purchaseApi: purchaseApi,
            kakaoRestApi: kakaoRestApi,
            instaRestApi: instaRestApi,
            appServiceApi: appServiceApi);
}
