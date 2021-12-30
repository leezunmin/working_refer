import 'dart:convert';

import 'package:application/models/kakao/app_kakao_local_search_coord2_result.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';

mixin KakaoRestRepositoryMixin on BaseRepository {
  Future<AppKakaoLocalSearchResult> localSearchAddress(String? query,
      {int page = 1}) {
    return kakaoRestApi
        .localSearchAddress(query, page: page)
        .then((String json) => AppKakaoLocalSearchResult.fromJson(json)!);
  }

  Future<AppKakaoLocalSearchDocument?> dongToKakaoLocalSearchDocument(
      AppRegionData rd) async {
    var result = await kakaoRestApi
        .localSearchAddress('${rd.region1} ${rd.region2} ${rd.region3}',
            page: 1)
        .then((String json) => AppKakaoLocalSearchResult.fromJson(json)!);
    if (result.documents.isNotEmpty) {
      return result.documents.first;
    } else {
      return null;
    }
  }

  Future<AppKakaoLocalSearchCoord2Result> localGeoCoord2address(
      double? lat, double? long) {
    return kakaoRestApi.localGeoCoord2address(lat, long).then((String _json) {
      return AppKakaoLocalSearchCoord2Result.fromMap(json.decode(_json))!;
    });
  }
}
