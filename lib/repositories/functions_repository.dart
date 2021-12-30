import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';

mixin FunctionsRepositoryMixin on BaseRepository {
  Future<bool?> initMyUserLike() async {
    dynamic result = await functionsApi.initMyUserLike();
    return result.data['success'];
  }

  Future<bool?> updateFcmKey(String? fcmKey) async {
    dynamic result = await functionsApi.updateFcmKey(fcmKey);
    return result.data['success'];
  }

  // Future<bool?> updateInstaAuth(InstaAuth instaAuth) async {
  //   dynamic result = await functionsApi.updateInstaAuth(instaAuth);
  //   return result.data['success'];
  // }

  Future<bool?> deleteInstaAuth() async {
    dynamic result = await functionsApi.deleteInstaAuth();
    return result.data['success'];
  }

  Future<bool?> syncUserData(String? idtoken) async {
    dynamic result = await functionsApi.syncUserData(idtoken);
    return result.data['success'];
  }

  Future<double> distanceBetween(String targetId) async {
    dynamic result = await functionsApi.distanceBetween(targetId);
    return result.data['distance'] * 1.0;
  }

  Future<bool?> refreshRecommendationFriend() async {
    dynamic result = await functionsApi.refreshRecommendationFriend();
    return result.data['success'];
  }

  Future<bool?> loadNextRecommendationFriend() async {
    dynamic result = await functionsApi.loadNextRecommendationFriend();
    return result.data['success'];
  }

  Future<bool?> initCurrentRecommendationPage(String idtoken) async {
    dynamic result = await functionsApi.initCurrentRecommendationPage(idtoken);
    return result.data['success'];
  }

  Future<bool?> blockPhoneNumberByUserId(String? phoneNumber) async {
    dynamic result = await functionsApi.blockPhoneNumberByUserId(phoneNumber);
    return result.data['success'];
  }

  Future<bool?> blockPhoneNumber(String? phoneNumber) async {
    dynamic result = await functionsApi.blockPhoneNumber(phoneNumber);
    return result.data['success'];
  }

  Future<bool?> blockPhoneNumbers(List<String> phoneNumbers) async {
    dynamic result = await functionsApi.blockPhoneNumbers(phoneNumbers);
    return result.data['success'];
  }

  Future<bool?> unBlockPhoneNumber(String? targetUserId) async {
    dynamic result = await functionsApi.unBlockPhoneNumber(targetUserId);
    return result.data['success'];
  }

  Future<bool?> clearAllBlock() async {
    dynamic result = await functionsApi.clearAllBlock();
    return result.data['success'];
  }

  Future<bool?> addFacebookBlock(
      String faceBookUserId, String accessToken) async {
    dynamic result =
        await functionsApi.addFacebookBlock(faceBookUserId, accessToken);
    return result.data['success'];
  }

  Future<bool?> removeFaceBookBlock() async {
    dynamic result = await functionsApi.removeFaceBookBlock();
    return result.data['success'];
  }

  Future<bool?> evaluateUser(
      String? targetUserId, AppLikeTypeEnum likeType) async {
    dynamic result = await functionsApi.likeUser(targetUserId, likeType);
    return result.data['success'];
  }

  Future<bool?> superlikeUser(String? idtoken, String? targetUserId) async {
    dynamic result = await functionsApi.superlikeUser(idtoken, targetUserId);
    return result.data['success'];
  }

  Future<bool?> superLikesUsingStar(
      String? idtoken, String? targetUserId) async {
    dynamic result =
        await functionsApi.superLikesUsingStar(idtoken, targetUserId);
    return result.data['success'];
  }

  Future<bool?> revertEvaluation(String? idtoken) async {
    dynamic result = await functionsApi.revertEvaluation(idtoken);
    return result.data['success'];
  }

  Future<AppUser?> userProfileInitailized() async {
    await functionsApi.userProfileInitailized();
    final result = await firestoreApi.getMyUserData();
    AppUser? _u = AppUser.fromMap(result.data());
    return _u;
    // final result = await firestoreApi.tmpInitProfile();
    // return AppUser.fromMap(result.data());
  }

  Future<bool?> deleteUserAuth() async {
    dynamic result = await functionsApi.deleteUserAuth();
    return result.data['success'];
  }

  Future<bool?> isExistPhoneNumber(String? phoneNumber) async {
    // https://github.com/firebase/firebase-admin-node/issues/349
    dynamic result = await functionsApi.existPhoneNumber(phoneNumber);
    return result.data['success'];
  }

  Future<bool> isExistEmailAdmin(String email) async {
    dynamic result = await functionsApi.existEmailAdmin(email);
    return result.data['success'];
  }

  Future<bool> isExistAccountProviderAdmin(
      String provider, String providerUid) async {
    dynamic result =
        await functionsApi.existAccountProviderAdmin(provider, providerUid);
    return result.data['success'];
  }

  Future<bool?> isExistEmail(String email) async {
    dynamic result = await functionsApi.existEmail(email);
    return result.data['success'];
  }

  Future<bool?> sendCodeForSignIn(String email) async {
    dynamic result = await functionsApi.sendCodeForSignIn(email);
    return result.data['success'];
  }

  Future<bool?> sendCodeForVerifyEmail(String email) async {
    dynamic result = await functionsApi.sendCodeForVerifyEmail(email);
    return result.data['success'];
  }

  Future<bool?> verifyCodeForSignIn(String email, String code) async {
    dynamic result = await functionsApi.verifyCodeForSignIn(email, code);
    return result.data['success'];
  }

  Future<bool?> verifyCodeForVerifyEmail(String? email, String code) async {
    dynamic result = await functionsApi.verifyCodeForVerifyEmail(email, code);
    return result.data['success'];
  }

  Future<Map<String, dynamic>?> verifyCodeForSignInToken(
      String? email, String code) async {
    dynamic result = await functionsApi.verifyCodeForSignIn(email, code);
    return result.data;
    // if (result.data['success'] && token!.isNotEmpty) {
    //   return token;
    // } else {
    //   return null;
    // }
  }

  Future<bool?> signUpProfileCertification(String testImage) async {
    dynamic result = await functionsApi.signUpProfileCertification(testImage);
    return result.data['success'];
  }

  Future<bool?> initProfileCertification() async {
    dynamic result = await functionsApi.initProfileCertification();
    return result.data['success'];
  }

  Future<bool?> inviteMeetHomeMember(String? userId, String? meetId) async {
    dynamic result = await functionsApi.inviteMeetingHomeMember(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> inviteMeetHomeMemberByDlink(
      String? userId, String? meetId, String dLinkId) async {
    dynamic result = await functionsApi.inviteMeetingHomeMemberByDlink(
        userId, meetId, dLinkId);
    return result.data['success'];
  }

  Future<bool?> inviteMeetingAwayMember(String? userId, String? meetId,
      {String? teamId}) async {
    dynamic result = await functionsApi.inviteMeetingAwayMember(userId, meetId,
        teamId: teamId);
    return result.data['success'];
  }

  Future<bool?> superApplyMeeting(
      String? ownerId, String? meetId, String? idToken) async {
    dynamic result =
        await functionsApi.superApplyMeeting(ownerId, meetId, idToken);
    return result.data['success'];
  }

  Future<bool?> superApplyMeetingUsingStar(
      String? ownerId, String? meetId, String? idToken) async {
    dynamic result =
        await functionsApi.superApplyMeetingUsingStar(ownerId, meetId, idToken);
    return result.data['success'];
  }

  Future<bool?> signUpMeeting(String? ownerId, String? meetId) async {
    dynamic result = await functionsApi.signUpMeeting(ownerId, meetId);
    return result.data['success'];
  }

  Future<bool?> approveMeetingInvitation(String? userId, String? meetId) async {
    dynamic result =
        await functionsApi.approveMeetingInvitation(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> approveAwayTeamInvitation(String userId, String meetId) async {
    dynamic result =
        await functionsApi.approveAwayTeamInvitation(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> approveMeetTeamSignUp(String? teamId, String? meetId) async {
    dynamic result =
        await functionsApi.approveMeetingTeamSignUp(teamId, meetId);
    return result.data['success'];
  }

  Future<bool?> rejectSignedMeetingTeam(String? teamId, String? meetId) async {
    dynamic result = await functionsApi.rejectSignedMeetingTeam(teamId, meetId);
    return result.data['success'];
  }

  Future<bool?> approveMeetingSignUp(String? userId, String? meetId) async {
    dynamic result = await functionsApi.approveMeetingSignUp(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> cancelMeeting(String? meetId) async {
    dynamic result = await functionsApi.cancelMeeting(meetId);
    return result.data['success'];
  }

  Future<bool?> closeChatRoom(String chatRoomId) async {
    dynamic result = await functionsApi.closeChatRoom(chatRoomId);
    return result.data['success'];
  }

  Future<bool?> secedeMeeting(
      String? userId, String? meetId, String? idToken) async {
    dynamic result = await functionsApi.secedeMeeting(userId, meetId, idToken);
    return result.data['success'];
  }

  Future<bool?> rejectMeetingInvitation(String? userId, String? meetId) async {
    dynamic result = await functionsApi.rejectMeetingInvitation(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> rejectSignedMeetingUser(String userId, String meetId) async {
    dynamic result = await functionsApi
        .rejectSignedMeetingUser(userId, meetId)
        .catchError((e) {
      l.info(this, 'e');
      l.info(this, e);
    });
    return result.data['success'];
  }

  Future<bool?> kickMeetingMember(String userId, String meetId) async {
    dynamic result = await functionsApi.kickMeetingMember(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> kickMeetingTeamMember(String userId, String meetId) async {
    dynamic result = await functionsApi.kickMeetingTeamMember(userId, meetId);
    return result.data['success'];
  }

  Future<bool?> temporaryAwayTeamSignUpMethod(
    String meetId,
    String teamId,
    String userId,
  ) async {
    dynamic result = await functionsApi.temporaryAwayTeamSignUpMethod(
        meetId, teamId, userId);
    return result.data['success'];
  }
}
