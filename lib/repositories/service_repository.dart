import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';

mixin AppServiceRepositoryMixin on BaseRepository {
  // Future<Map<String, dynamic>?> fetchInstaProfile(String targetUserId) async {
  //   Map<String, dynamic>? result =
  //       await appServiceApi.fetchInstaProfile(targetUserId);

  //   if (result != null) {
  //     return result;
  //   }
  //   return null;
  // }

  // Future<List<String>?> fetchInstaUserMediaIds(String targetUserId) async {
  //   List<String>? result =
  //       await appServiceApi.fetchInstaUserMediaIds(targetUserId);

  //   if (result != null) {
  //     return result;
  //   }
  //   return null;
  // }

  Future<List<String>?> updateMyInstaMediaIds() async {
    List<String>? result = await appServiceApi.updateMyInstaMediaIds();

    if (result != null) {
      return result;
    }
    return null;
  }

  Future<bool> fetchProfileShowable(String targetUserId) async {
    Map<String, dynamic>? result =
        await appServiceApi.fetchProfileShowable(targetUserId);

    if (result != null) {
      return result['showable'] ?? false;
    }
    return false;
  }

  Future<bool> createShown(String targetUserId) async {
    Map<String, dynamic>? result =
        await appServiceApi.createShown(targetUserId);

    if (result != null) {
      return result['shown'] ?? false;
    }
    return false;
  }

  Future<AppServiceEvaluation?> fetchEvaluation(String targetUserId) async {
    Map<String, dynamic>? result =
        await appServiceApi.fetchEvaluation(targetUserId);

    if (result != null) {
      return AppServiceEvaluation.fromMap(result);
    }
    return null;
  }

  Future<AppLike?> fetchLikeFromEvaluation(String? targetUserId) async {
    if (targetUserId == null) return null;
    Map<String, dynamic>? result =
        await appServiceApi.fetchEvaluation(targetUserId);

    if (result != null) {
      AppServiceEvaluation? evaluation = AppServiceEvaluation.fromMap(result);

      return evaluation?.toLike();
    }
    return null;
  }

  Future<AppServiceEvaluation?> createLike(
      String targetUserId, AppLikeTypeEnum type) async {
    Map<String, dynamic>? result =
        await appServiceApi.createLike(targetUserId, type);

    if (result != null) {
      return AppServiceEvaluation.fromMap(result);
    }
    return null;
  }

  Future<AppServiceEvaluation?> deleteLike(
      String targetUserId, AppLikeTypeEnum type) async {
    Map<String, dynamic>? result = await appServiceApi.deleteLike(targetUserId);

    if (result != null) {
      return AppServiceEvaluation.fromMap(result);
    }
    return null;
  }

  Future<List<AppServiceEvaluation?>> fetchLikes({int page = 0}) async {
    List<Map<String, dynamic>> results =
        await appServiceApi.fetchLikes(page: page);
    return results.map((e) => AppServiceEvaluation.fromMap(e)).toList();
  }

  Future<List<AppServiceEvaluation?>> fetchRecvLikes({int page = 0}) async {
    List<Map<String, dynamic>> results =
        await appServiceApi.fetchRecvLikes(page: page);
    return results.map((e) => AppServiceEvaluation.fromMap(e)).toList();
  }

  Future<List<AppServiceEvaluation?>> fetchSentLikes({int page = 0}) async {
    List<Map<String, dynamic>> results =
        await appServiceApi.fetchSentLikes(page: page);
    return results.map((e) => AppServiceEvaluation.fromMap(e)).toList();
  }

  Future<List<AppServiceEvaluation?>> fetchMatchs({int page = 0}) async {
    List<Map<String, dynamic>> results =
        await appServiceApi.fetchMatchs(page: page);
    return results.map((e) => AppServiceEvaluation.fromMap(e)).toList();
  }

  Future<List<AppServiceEvaluation?>> checkLikeUsers(List<String> userIds,
      {bool isSent = false}) async {
    List<Map<String, dynamic>> results =
        await appServiceApi.checkLikeUsers(userIds, isSent: isSent);
    return results.map((e) => AppServiceEvaluation.fromMap(e)).toList();
  }

  Future<List<String>> checkUserIds(
    List<dynamic> userIds,
  ) async {
    List<String> results = await appServiceApi.checkUserIds(userIds);
    return results;
  }

  Future<bool> checkAvalableUser(
    String userId,
  ) async {
    bool results = await appServiceApi.checkAvalableUser(userId);
    return results;
  }

  Future<AppServiceCount?> fetchRecvLikeCount(
      {bool withoutMatchs = false}) async {
    Map<String, dynamic> result =
        await appServiceApi.fetchRecvLikeCount(withoutMatchs: withoutMatchs);
    var _ = AppServiceCount.fromMap(result);
    return _;
  }

  Stream<AppServiceCount?> recvLikeCount({Duration? interval}) async* {
    var mInterval = interval ?? const Duration(seconds: 5);
    while (true) {
      var result = await fetchRecvLikeCount(withoutMatchs: true);
      // l.info(
      //     this, 'AppServiceRepositoryMixin: recvLikeCount: ${result?.count}');
      yield result;
      await Future.delayed(mInterval);
    }
  }

  Future<AppServiceCount?> fetchSentLikeCount(
      {bool withoutMatchs = false, bool withSorry = false}) async {
    Map<String, dynamic> result = await appServiceApi.fetchSentLikeCount(
        withoutMatchs: withoutMatchs, withSorry: withSorry);
    return AppServiceCount.fromMap(result);
  }

  Future<AppServiceCount?> fetchSentSorryCount() async {
    Map<String, dynamic> result = await appServiceApi.fetchSentSorryCount();
    return AppServiceCount.fromMap(result);
  }
}
