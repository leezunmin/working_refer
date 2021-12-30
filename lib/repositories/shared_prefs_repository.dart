import 'package:application/repositories/repository.dart';

mixin SharedPrefsRepository on BaseRepository {
  String? getBuildNumber() {
    return sharedPrefsApi.getBuildNumber();
  }

  Future<bool> setBuildNumber(String buildNumber) {
    return sharedPrefsApi.setBuildNumber(buildNumber);
  }

  Future<bool> removeBuildNumber() {
    return sharedPrefsApi.removeBuildNumber();
  }

  Future<bool> setHiddenRecommendGuide(bool hide) {
    return sharedPrefsApi.setHiddenRecommendGuide(hide);
  }

  bool getHiddenRecommendGuide() {
    return sharedPrefsApi.getHiddenRecommendGuide();
  }

  Future<bool> setHiddenWellcomGuide(bool hide, String uid) {
    return sharedPrefsApi.setHiddenWellcomGuide(hide, uid);
  }

  bool getHiddenWellcomGuide(String uid) {
    return sharedPrefsApi.getHiddenWellcomGuide(uid);
  }
}
