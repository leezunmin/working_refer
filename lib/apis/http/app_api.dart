import 'dart:io';

import 'package:application/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;

mixin AppApiMixin {
  Map<String, String> authorization(String idToken) {
    return {HttpHeaders.authorizationHeader: "Bearer $idToken"};
  }

  Map<String, String> tokenAuthorization(String idToken) {
    return {'x-idtoken': idToken};
  }

  Map<String, String> kakaoaRestAuthorization(
      {String restKey = "1bb297db6a03c7d164eeeb4806e7a158"}) {
    return {HttpHeaders.authorizationHeader: "KakaoAK $restKey"};
  }

  Map<String, String> applicationJson() {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  Map<String, String> applicationJsonAndAuthorization(String idToken) {
    return applicationJson()..addAll(authorization(idToken));
  }

  Map<String, String> applicationJsonAndXIdToken(String idToken) {
    return applicationJson()..addAll(tokenAuthorization(idToken));
  }

  Map<String, String> applicationJsonAndKakaoaRestAuthorization(
      {String restKey = "1bb297db6a03c7d164eeeb4806e7a158"}) {
    return applicationJson()..addAll(kakaoaRestAuthorization(restKey: restKey));
  }

  Future<String> deleteRequestWithBody(String body, String url) async {
    http.Request rq = http.Request('DELETE', Uri.parse(url))
      ..headers.addAll({HttpHeaders.contentTypeHeader: 'application/json'});
    rq.body = body;
    http.StreamedResponse response = await http.Client().send(rq);
    String value = await response.stream.bytesToString();
    return value;
  }
}

class AppApi {
  final String? api = null;
  final AuthService authService;

  AppApi(this.authService);

  dynamic nullOrValue(dynamic value, {dynamic alternativeValue}) {
    if (value == null) return null;
    return value
        ? alternativeValue
            ? alternativeValue
            : value
        : null;
  }
}
