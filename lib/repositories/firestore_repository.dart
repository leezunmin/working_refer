import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/utils/utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

mixin FirestoreRepositoryMixin on BaseRepository {
  Future addPost(AppPost post,
      {AppVote? vote, List<AppVoteItem>? voteItemList}) {
    return firestoreApi.addPost(post,
        appVote: vote, voteItemList: voteItemList);
  }

  Future editPost(AppPost post, String? postUid) {
    return firestoreApi.editPost(post, postUid);
  }

  Future<AppVote?> fetchVote(String voteUid) async {
    if (voteUid == null) return null;

    return firestoreApi.fetchVote(voteUid).then((ds) {
      if (ds.exists) {
        AppVote? vote = AppVote.fromMap(ds.data()!);
        return AppVote.fromMap(ds.data()!);
      } else {
        return null;
      }
    });
  }

  Future<List<AppVoteItem?>> getVoteItem(String voteUid) async {
    // if (voteUid == null) return null;
    List<AppVoteItem?> voteItems = [];

    await firestoreApi.getVoteItem(voteUid).then((ds) {
      for (var element in ds.docs) {
        voteItems.add(AppVoteItem.fromMap(element.data()));
      }
    });
    return voteItems;
  }

  Future<AppPost?> getPost(String? postId) async {
    if (postId == null) return null;
    return firestoreApi.getPost(postId).then((ds) {
      if (ds.exists) {
        return AppPost.fromMap(ds.data()!);
      } else {
        return null;
      }
    });
  }

  Stream<List<AppPost?>> posts() {
    return firestoreApi
        .posts()
        .map((qs) => qs.docs.map((e) => AppPost.fromMap(e.data())).toList());
  }

  Future? fetchFirstPost({String? filter, String? header, String? ownerId}) {
    return firestoreApi.fetchFirstPost(filter != '' ? filter : "createdAt",
        header: header == "" ? null : header, ownerId: ownerId);
  }

  Future fetchNextPost(
      List<DocumentSnapshot<Map<String, dynamic>>> documentList,
      {String? filter,
      String? header,
      String? ownerId}) {
    return firestoreApi.fetchNextPost(
        documentList, filter != '' ? filter : "createdAt",
        header: header == "" ? null : header, ownerId: ownerId);
  }

  Future getFirstOwnerPost(String? ownerId) {
    return firestoreApi.getFirstOwnerPost(ownerId);
  }

  Future getNextOwnerPost(String? ownerId,
      List<DocumentSnapshot<Map<String, dynamic>>> documentList) {
    return firestoreApi.getNextOwnerPost(ownerId, documentList);
  }

  Stream<List<AppPost?>> getPostLikedBloc(String? ownerId) {
    return firestoreApi
        .getPostLikedBloc(ownerId)
        .map((qs) => qs.docs.map((e) => AppPost.fromMap(e.data())).toList());
  }

  Future<dynamic> getPushedPost(String? postUid) {
    return firestoreApi.getPushedPost(postUid).then((ds) {
      var data = ds.data();
      // return AppPost.fromMap(data!)!;
      try {
        return AppPost.fromMap(data!)!;
      } catch (e) {
        // 삭제된 글
        l.info(this, 'getPushedPost catch e >> ' + e.toString());
        var result;
        return result;
      }
    });
  }

  Future castVote(AppVote vote, String itemUid, String voteUser) {
    return firestoreApi.castVote(vote, itemUid, voteUser);
  }

  Future calculateVote(AppVote vote) {
    return firestoreApi.calculateVote(vote);
  }

  Stream<List<AppReply?>> getReplyStream({String? postUid, String? ownerId}) {
    return firestoreApi
        .getReplyStream(postUid: postUid, ownerId: ownerId)
        .map((qs) => qs.docs.map((e) {
              // l.info(this, 'e.data() >> ' + e.data().toString());
              var fromMap = AppReply.fromMap(e.data());
              return fromMap;
            }).toList());
  }

  Future<AppPost?> getReplyParentPost(String replyPostUid) async {
    return Future.value(firestoreApi.getReplyParentPost(replyPostUid))
        .then((value) {
      var data = value.data();
      AppPost post = AppPost.fromMap(data!)!;
      return post;
    });
  }

  Stream<List<AppReReply?>> getReReplyStream(String? replyUid) {
    return firestoreApi.getReReplyStream(replyUid).map((qs) => qs.docs.map((e) {
          var fromMap = AppReReply.fromMap(e.data());
          return fromMap;
        }).toList());
  }

  Future<bool> ifExistLike(String? postUid, String userId) async {
    return (await firestoreApi.ifExistLike(postUid, userId));
  }

  Future<bool> ifExistVote(String? voteUid, String userId) async {
    return (await firestoreApi.ifExistVote(voteUid, userId));
  }

  Future increasePostLike(String? postUid, String? userId) async {
    return await firestoreApi.increasePostLike(postUid, userId);
  }

  Future decreasePostLike(String? postUid, String? userId) async {
    return await firestoreApi.decreasePostLike(postUid, userId);
  }

  Future removePost(DocumentReference ref, {String? postUid}) {
    return firestoreApi.removePost(ref, postUid: postUid);
  }

  Future removeAppPost(DocumentReference ref, {String? postUid}) {
    return firestoreApi.removeAppPost(ref, postUid: postUid);
  }

  Future increaseField(DocumentReference ref, {String? field, int? value}) {
    return firestoreApi.increaseField(ref, field: field, value: value);
  }

  Stream<List<Faq?>> faqs() {
    return firestoreApi.getFaqs().map((qs) => qs.docs.map((e) {
          try {
            var _ = Faq.fromMap(e.data()..putIfAbsent('id', () => e.id));
            return _;
          } catch (e) {
            l.info(
                this, 'Stream<List<Faq?>> faqs >> catch e >>' + e.toString());
          }
        }).toList());
  }

  Future addQna(Qna qna) {
    return firestoreApi.addQna(authBloc.currentUserId, qna.toMap());
  }
}
