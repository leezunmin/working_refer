// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';

// import 'package:application/consts/consts.dart';
// import 'package:application/models/models.dart';
// import 'package:application/repositories/repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/services.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';
// import 'package:intl/intl.dart';
// import 'package:location/location.dart';
// import 'package:path_provider/path_provider.dart';

// export 'formatter.dart';

// const String defaultSocialImageUrl =
//     'https://bemy-prod.imgix.net/open_graph_default_img.jpeg';

// String _dateString(DateTime date) {
//   DateFormat dateFormat = DateFormat('yyyy.MM.dd(E)', 'ko_KR');
//   String formatedDateString = dateFormat.format(date);
//   return formatedDateString;
// }

// int dDays(DateTime dDate) {
//   DateTime now = DateTime.now();
//   int dSec =
//       ((dDate.millisecondsSinceEpoch - now.millisecondsSinceEpoch) / 1000)
//           .round();
//   int oneDay = 60 * 60 * 24;
//   int dDays = (dSec / oneDay).ceil();
//   if (now.year == dDate.year &&
//       now.month == dDate.month &&
//       now.day == dDate.day) {
//     dDays = 0;
//   }

//   return dDays;
// }

// String dateString(String inputString) {
//   DateTime date = DateTime.parse(inputString);
//   return _dateString(date);
// }

// String dashDateStringToString(String inputString) {
//   DateFormat dateFormat = DateFormat('yyyy-MM-dd', 'ko_KR');
//   DateTime date = dateFormat.parse(inputString);
//   return _dateString(date);
// }

// String dateStringSimple(String inputString) {
//   DateFormat dateFormat = DateFormat('yyyy.MM.dd', 'ko_KR');
//   DateTime date = DateTime.parse(inputString);
//   String formatedDateString = dateFormat.format(date);

//   return formatedDateString;
// }

// String timeString(String inputString) {
//   DateFormat dateFormat = DateFormat('H:mm', 'ko_KR');
//   DateTime date = DateTime.parse(inputString);
//   String formatedDateString = dateFormat.format(date);

//   return formatedDateString;
// }

// String moneyString(int input) {
//   NumberFormat oCcy = NumberFormat("#,###", "en_US");
//   return oCcy.format(input);
// }

// Timestamp? timeMapToTimestamp(Map<dynamic, dynamic> timeMap) {
//   if (timeMap['_seconds'] == null || timeMap['_nanoseconds']) return null;
//   return Timestamp(timeMap['_seconds'], timeMap['_nanoseconds']);
// }

// Timestamp timeMapToDateTime(DateTime dateTime) {
//   return Timestamp((dateTime.millisecondsSinceEpoch / 1000).round(), 0);
// }

// // https://stackoverflow.com/questions/63292839/how-to-validate-email-in-a-textformfield
// bool validateEmail(String value) {
//   Pattern pattern =
//       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//       r"{0,253}[a-zA-Z0-9])?)*$";
//   RegExp regex = RegExp(pattern as String);

//   if (!regex.hasMatch(value)) {
//     return false;
//   } else {
//     return true;
//   }
// }

// //https://firebase.flutter.dev/docs/auth/social
// /// Generates a cryptographically secure random nonce, to be included in a
// /// credential request.
// String appGenerateNonce([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }

// //https://firebase.flutter.dev/docs/auth/social
// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }

// String fromPathToUrl(String storagePath, {Environment? environment}) {
//   FirebaseEnv fbEnv =
//       environment == null ? FirebaseEnv.prod : environment.firebaseEnv;
//   String imgixUrl = fbEnv == FirebaseEnv.prod ? imgixProdUrl : imgixDevUrl;
//   String url = '$imgixUrl/${storagePath.substring(7)}';
//   return url;
// }

// String fromUrlToPath(String url, {Environment? environment}) {
//   FirebaseEnv fbEnv =
//       environment == null ? FirebaseEnv.prod : environment.firebaseEnv;
//   String imgixUrl = fbEnv == FirebaseEnv.prod ? imgixProdUrl : imgixDevUrl;
//   String path = url.replaceAll(imgixUrl, 'images');
//   return path;
// }

// Future<LocationData?> _getLocation() async {
//   Location location = Location();

//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   LocationData _locationData;

//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       return null;
//     }
//   }

//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return null;
//     }
//   }

//   _locationData = await location.getLocation();
//   return _locationData;
// }

// Future<GeoPoint?> getMyLocation() async {
//   var _loc = await _getLocation();
//   if (_loc == null) return null;
//   return GeoPoint(_loc.latitude!, _loc.longitude!);
// }

// Future<double> computeDistance(double lat, double lng) async {
//   final geo = Geoflutterfire();
//   var _loc = await _getLocation();
//   var point = geo.point(latitude: _loc!.latitude!, longitude: _loc.longitude!);
//   var distance = point.distance(lat: lat, lng: lng);
//   return distance;
// }

// Future<String> getSiDoDong(Repository? _repo) async {
//   var address = await getSiDoDongAddress(_repo);
//   if (address != null) {
//     var q =
//         "${address.region1depthName} ${address.region2depthName} ${address.region3depthName}";
//     return q;
//   }
//   return '';
// }

// Future<AppKakaoLocalSearchDocumentCoord2Address?> getSiDoDongAddress(
//     Repository? _repo) async {
//   var _loc = await _getLocation();
//   if (_loc == null) return null;

//   var result =
//       await _repo!.localGeoCoord2address(_loc.latitude, _loc.longitude);
//   var _list = result.documents
//       .where((e) => e.address.region3depthName.isNotEmpty)
//       .toList();
//   if (_list.isNotEmpty) {
//     var first = _list.first;
//     var address = first.address;

//     return address;
//   }
// }

// List<String> makeKeywords(String text, {List<String>? defaluts}) {
//   RegExp exp = RegExp(r"[^\s^\t]+");
//   String str = text;
//   Iterable<RegExpMatch> matches = exp.allMatches(str);
//   List<String> ks = [];
//   if (defaluts != null) {
//     ks = ks..addAll(defaluts);
//   }
//   var _ = matches.map((e) {
//     // l.info(this, str.substring(e.start, e.end));
//     return str.substring(e.start, e.end);
//   }).forEach((k) {
//     if (!ks.contains(k)) {
//       ks.add(k);
//     }
//   });

//   return ks;
// }

// Future<Uri> makeMeetGuideLink(bool isMeeting,
//     {bool isShortLink = false}) async {
//   // String title = isMeeting ? '반짝만남 미팅 사용법' : '반짝만남 모임 사용법';
//   String title = isMeeting ? '반짝만남 모임 사용법' : '반짝만남 미팅 사용법';
//   String description = '';
//   Uri imageUri =
//       Uri.parse(isMeeting ? imageMeeutingThumpUrl : imageMeeutupThumpUrl);

//   String typeString = AppShareLinkType.postGuide.toString();
//   String meetTypeString = isMeeting ? 'meeting' : 'oneoff';

//   String dLink =
//       'https://bemy.io?linktype=$typeString&meettype=$meetTypeString';

//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://bemy.page.link',
//       link: Uri.parse(dLink),
//       androidParameters: const AndroidParameters(
//         packageName: 'io.bemy.application',
//         // minimumVersion: 125,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'io.bemy.application',
//         // minimumVersion: '1.0.1',
//         appStoreId: '1551262437',
//       ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//           title: title, description: description, imageUrl: imageUri),
//       navigationInfoParameters: const NavigationInfoParameters());

//   if (isShortLink) {
//     final ShortDynamicLink shortDynamicLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//     final Uri shortUrl = shortDynamicLink.shortUrl;
//     return shortUrl;
//   }
//   final Uri dynamicUrl =
//       await FirebaseDynamicLinks.instance.buildLink(parameters);
//   return dynamicUrl;
// }

// Future<Uri> makeMeetLink(AppMeet meet, AppShareLinkType type,
//     {bool isShortLink = false, String? teamId = 'home'}) async {
//   String title = meet.title != null ? meet.title! : '';
//   String description = _makeDescription(type);
//   Uri imageUri = Uri.parse(meet.photo);

//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://bemy.page.link',
//       link: Uri.parse(_makeMeetDLink(meet, type, teamId: teamId)),
//       androidParameters: const AndroidParameters(
//         packageName: 'io.bemy.application',
//         // minimumVersion: 125,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'io.bemy.application',
//         // minimumVersion: '1.0.1',
//         appStoreId: '1551262437',
//       ),
//       // googleAnalyticsParameters: GoogleAnalyticsParameters(
//       //   campaign: 'example-promo',
//       //   medium: 'social',
//       //   source: 'orkut',
//       // ),
//       // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
//       //   providerToken: '123456',
//       //   campaignToken: 'example-promo',
//       // ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//           title: title, description: description, imageUrl: imageUri),
//       navigationInfoParameters: const NavigationInfoParameters());

//   if (isShortLink) {
//     final ShortDynamicLink shortDynamicLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//     final Uri shortUrl = shortDynamicLink.shortUrl;
//     return shortUrl;
//   }
//   final Uri dynamicUrl =
//       await FirebaseDynamicLinks.instance.buildLink(parameters);
//   return dynamicUrl;
// }

// Future<Uri> makePostLink(AppPost post, {bool isShortLink = false}) async {
//   String title = post.title != null ? post.title! : '공유링크';
//   String description = '앱에서 확인하기';
//   Uri imageUri = Uri.parse(defaultSocialImageUrl);
// /*
//   if (이미지가 있으면) {
//     var url = fromPathToUrl('storagePath');
//     imageUri = Uri.parse(url);
//   }
// */
//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://bemy.page.link',
//       link: Uri.parse(_makePostDLink(post)),
//       androidParameters: const AndroidParameters(
//         packageName: 'io.bemy.application',
//         // minimumVersion: 125,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'io.bemy.application',
//         // minimumVersion: '1.0.1',
//         appStoreId: '1551262437',
//       ),
//       // googleAnalyticsParameters: GoogleAnalyticsParameters(
//       //   campaign: 'example-promo',
//       //   medium: 'social',
//       //   source: 'orkut',
//       // ),
//       // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
//       //   providerToken: '123456',
//       //   campaignToken: 'example-promo',
//       // ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//           title: title, description: description, imageUrl: imageUri),
//       navigationInfoParameters: const NavigationInfoParameters());

//   if (isShortLink) {
//     final ShortDynamicLink shortDynamicLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//     final Uri shortUrl = shortDynamicLink.shortUrl;
//     return shortUrl;
//   }
//   final Uri dynamicUrl =
//       await FirebaseDynamicLinks.instance.buildLink(parameters);
//   return dynamicUrl;
// }

// String _makeDescription(AppShareLinkType type) {
//   if (type == AppShareLinkType.invite) {
//     return '앱에서 초대 수락하기';
//   } else {
//     return '앱에서 확인하기';
//   }
// }

// String _makeMeetDLink(AppMeet? meet, AppShareLinkType type,
//     {String? teamId = ''}) {
//   // String typeString = type == AppMeetShareLinkType.invite ? 'invite' : 'share';
//   String typeString = type.toString();

//   if (type == AppShareLinkType.invite) {
//     return 'https://bemy.io?linktype=$typeString&meet=${meet!.id}&meettype=${meet.type.toString()}&team=$teamId';
//   } else {
//     return 'https://bemy.io?linktype=$typeString&meet=${meet!.id}&meettype=${meet.type.toString()}';
//   }
// }

// String _makePostDLink(AppPost post) {
//   String typeString = AppShareLinkType.post.toString();
//   return 'https://bemy.io?linktype=$typeString&post=${post.postUid}';
// }

// List<String> sortIds(List<String> ids) {
//   List<String> _ids = ids.map((id) => id.toLowerCase()).toList();
//   _ids.sort((a, b) => a.compareTo(b));
//   for (var id in ids) {
//     String lowId = id.toLowerCase();
//     _ids[_ids.indexOf(lowId)] = id;
//   }
//   return _ids;
// }

// Future<File> getImageFileFromAssets(String path) async {
//   final fileName = path.split('/').last;
//   final byteData = await rootBundle.load('assets/images/3.0x/$fileName');

//   final file = File('${(await getTemporaryDirectory()).path}/$fileName ');
//   await file.writeAsBytes(byteData.buffer
//       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

//   return file;
// }
