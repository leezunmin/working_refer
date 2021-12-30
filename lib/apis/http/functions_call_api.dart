// import 'package:application/models/models.dart';
// import 'package:cloud_functions/cloud_functions.dart';

// class FunctionsApi {
//   final FirebaseFunctions _fns;
//   FunctionsApi(this._fns);

//   Future<dynamic> updateFcmKey(String? fcmKey) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-updateFcmKey',
//     );
//     try {
//       dynamic res = await callable.call({'fcmKey': fcmKey});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> updateInstaAuth(InstaAuth instaAuth) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-updateInstaAuth',
//     );
//     try {
//       final instaAuthData = instaAuth.toMap();
//       dynamic res = await callable.call({'instaAuth': instaAuthData});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> deleteInstaAuth() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-deleteInstaAuth',
//     );
//     try {
//       dynamic res = await callable.call();
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> syncUserData(String? idtoken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-syncUserData',
//     );
//     try {
//       dynamic res = await callable.call({"idtoken": idtoken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> distanceBetween(String targetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-distanceBetween',
//     );
//     try {
//       dynamic res = await callable.call({"targetId": targetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> refreshRecommendationFriend() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-refreshRecommendationFriend',
//     );
//     try {
//       dynamic res = await callable.call();
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> loadNextRecommendationFriend() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-loadNextRecommendationFriend',
//     );
//     try {
//       dynamic res = await callable.call();
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> initCurrentRecommendationPage(String idtoken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-initCurrentRecommendationPage',
//     );
//     try {
//       dynamic res = await callable.call({"idtoken": idtoken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> blockPhoneNumberByUserId(String? userId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-blockPhoneNumberByUserId',
//     );
//     try {
//       dynamic res = await callable.call({"userId": userId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> blockPhoneNumber(String? phoneNumber) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-blockPhoneNumber',
//     );
//     try {
//       dynamic res = await callable.call({"phoneNumber": phoneNumber});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> blockPhoneNumbers(List<String> phoneNumbers) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-blockPhoneNumbers',
//     );
//     try {
//       dynamic res = await callable.call({"phoneNumbers": phoneNumbers});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> unBlockPhoneNumber(String? phoneNumber) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-unBlockPhoneNumber',
//     );
//     try {
//       dynamic res = await callable.call({"phoneNumber": phoneNumber});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> clearAllBlock() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-clearAllBlock',
//     );
//     try {
//       dynamic res = await callable.call();
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> addFacebookBlock(
//       String faceBookUserId, String accessToken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-addFacebookBlock',
//     );
//     try {
//       dynamic res = await callable
//           .call({"faceBookUserId": faceBookUserId, "accessToken": accessToken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> removeFaceBookBlock() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-removeFaceBookBlock',
//     );
//     try {
//       dynamic res = await callable.call({});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> initMyUserLike() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-initUserLike',
//     );

//     try {
//       dynamic res = await callable.call({});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> likeUser(
//       String? targetUserId, AppLikeTypeEnum likeType) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-likeUser',
//     );
//     try {
//       dynamic res = await callable.call(
//           {"targetUserId": targetUserId, "likeType": likeType.toString()});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> superlikeUser(String? idtoken, String? targetUserId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-superlikeUser',
//     );
//     try {
//       dynamic res = await callable
//           .call({"idtoken": idtoken, "targetUserId": targetUserId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> superLikesUsingStar(
//       String? idtoken, String? targetUserId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-superLikesUsingStar',
//     );
//     try {
//       dynamic res = await callable
//           .call({"idtoken": idtoken, "targetUserId": targetUserId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> revertEvaluation(String? idtoken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-revertEvaluation',
//     );
//     try {
//       dynamic res = await callable.call({"idtoken": idtoken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> userProfileInitailized() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-userProfileInitailized',
//     );
//     try {
//       dynamic res = await callable.call({});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> deleteUserAuth() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-deleteUserAuth',
//     );
//     try {
//       dynamic res = await callable.call({});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> existPhoneNumber(String? phoneNumber) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-existPhoneNumber',
//     );
//     try {
//       dynamic res = await callable.call({"phoneNumber": phoneNumber});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> existEmailAdmin(String? email) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-existEmailAdmin',
//     );
//     try {
//       dynamic res = await callable.call({"email": email});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> existAccountProviderAdmin(
//       String providerId, String uid) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-existAccountProviderAdmin',
//     );
//     try {
//       dynamic res = await callable.call({"providerId": providerId, "uid": uid});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> existEmail(String email) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-existEmail',
//     );
//     try {
//       dynamic res = await callable.call({"email": email});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> verifyCodeForSignIn(String? email, String code) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-verifyCodeForSignIn',
//     );
//     try {
//       dynamic res = await callable.call({"email": email, "code": code});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> verifyCodeForVerifyEmail(String? email, String code) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-verifyCodeForVerifyEmail',
//     );
//     try {
//       dynamic res = await callable.call({"email": email, "code": code});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> sendCodeForSignIn(String email) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-sendCodeForSignIn',
//     );
//     try {
//       dynamic res = await callable.call({'email': email});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> sendCodeForVerifyEmail(String email) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-sendCodeForVerifyEmail',
//     );
//     try {
//       dynamic res = await callable.call({'email': email});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> signUpProfileCertification(String testImage) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-signUpProfileCertification',
//     );
//     try {
//       dynamic res = await callable.call({'testImage': testImage});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> initProfileCertification() async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-initProfileCertification',
//     );
//     try {
//       dynamic res = await callable.call({});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> callMakeMeeting(AppMeet meet, String ownerId) {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-makeMeeting',
//     );
//     var data = meet.toMap();
//     data['targetUsers'] = [ownerId];
//     return callable.call(data);
//   }

//   Future<dynamic> inviteMeetingHomeMember(
//       String? userId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-inviteMeetingHomeMember',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> inviteMeetingHomeMemberByDlink(
//       String? userId, String? meetId, String dLinkId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-inviteMeetingHomeMemberByDlink',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable
//           .call({"userId": userId, "meetId": meetId, "dLinkId": ''});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> inviteMeetingAwayMember(String? userId, String? meetId,
//       {String? teamId}) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-inviteMeetingAwayMember',
//     );
//     // meet owner
//     try {
//       var data = {"userId": userId, "meetId": meetId};
//       if (teamId != null) {
//         data = {"userId": userId, "meetId": meetId, "teamId": teamId};
//       }
//       dynamic res = await callable.call(data);
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> superApplyMeeting(
//       String? ownerId, String? meetId, String? idToken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-superApplyMeeting',
//     );

//     try {
//       dynamic res = await callable
//           .call({"userId": ownerId, "meetId": meetId, "idtoken": idToken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> superApplyMeetingUsingStar(
//       String? ownerId, String? meetId, String? idToken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-superApplyMeetingUsingStar',
//     );
//     try {
//       dynamic res = await callable
//           .call({"userId": ownerId, "meetId": meetId, "idtoken": idToken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> signUpMeeting(String? ownerId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-signUpMeeting',
//     );
//     try {
//       dynamic res = await callable.call({"userId": ownerId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> approveMeetingInvitation(
//       String? userId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-approveMeetingInvitation',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> approveAwayTeamInvitation(
//       String userId, String meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-approveAwayTeamInvitation',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> approveMeetingSignUp(String? userId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-approveMeetingSignUp',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> kickMeetingMember(String userId, String meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-kickMeetingMember',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> kickMeetingTeamMember(String userId, String meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-kickMeetingTeamMember',
//     );
//     // meet owner
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> cancelMeeting(String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-cancelMeeting',
//     );
//     try {
//       dynamic res = await callable.call({"meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> closeChatRoom(String? chatRoomId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-closeChatRoom',
//     );
//     try {
//       dynamic res = await callable.call({"chatRoomId": chatRoomId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> secedeMeeting(
//       String? userId, String? meetId, String? idtoken) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-secedeMeeting',
//     );
//     try {
//       dynamic res = await callable
//           .call({"userId": userId, "meetId": meetId, "idtoken": idtoken});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> rejectMeetingInvitation(
//       String? userId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-rejectMeetingInvitation',
//     );
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> rejectSignedMeetingUser(String userId, String meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-rejectSignedMeetingUser',
//     );
//     try {
//       dynamic res = await callable.call({"userId": userId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // TODO: 익셉션 남...
//   Future<dynamic> approveMeetingTeamSignUp(
//       String? teamId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-approveMeetingTeamSignUp',
//     );
//     try {
//       dynamic res = await callable.call({"teamId": teamId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> rejectSignedMeetingTeam(
//       String? teamId, String? meetId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-rejectSignedMeetingTeam',
//     );
//     try {
//       dynamic res = await callable.call({"teamId": teamId, "meetId": meetId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> temporaryAwayTeamSignUpMethod(
//       String meetId, String teamId, String userId) async {
//     final HttpsCallable callable = _fns.httpsCallable(
//       'http-temporaryAwayTeamSignUpMethod',
//     );
//     try {
//       dynamic res = await callable
//           .call({"teamId": teamId, "meetId": meetId, "userId": userId});
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
