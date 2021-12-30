import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:application/utils/utils.dart' as utils;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class FirestoreApi with LogMixin {
  final AuthService authBloc;
  final FirebaseFirestore _db;
  FirestoreApi(this.authBloc, this._db);

  Future addPost(AppPost post,
      {AppVote? appVote, List<AppVoteItem>? voteItemList}) async {
    WriteBatch writeBatch = _db.batch();
    DocumentReference documentRef = _db.collection('posts').doc();

    try {
      writeBatch.set(documentRef, post.toMap() as Map<String, dynamic>);
      writeBatch.update(documentRef, {'postUid': documentRef.id});

      await writeBatch.commit().catchError((onError) {
        l.info(this, 'addPost writeBatch.commit catchError >> ');
        l.info(onError, 'addPost writeBatch.commit Exception >> ');
      });

      if (appVote != null) {
        // post batch commit 이 완료된 이후에 post doc ref를 참조하여 vote 입력이 가능함
        await addPostVotes(appVote, voteItemList!, documentRef.id);
      }
    } catch (e) {
      l.info(this, 'addPost error >> ' + e.toString());
      l.info(this, 'addPost error runtimeType >> ' + e.runtimeType.toString());
    }
  }

  Future addPostVotes(
      AppVote vote, List<AppVoteItem> voteItemList, String postUid) async {
    try {
      WriteBatch voteBatch = _db.batch();

      // appVote객체 투표 객체 id 자동생성
      DocumentReference voteRef = _db.collection('votes').doc();
      final voteUid = voteRef.id;

      // 원글 post에도 voteUid 업데이트
      // post doc 입력이 실제로 완료되어야 참조가 가능함
      DocumentReference postRef = _db.collection('posts').doc(postUid);
      voteBatch.update(postRef, {'voteUid': voteUid});
      // 투표 votes 콜렉션에 vote 객체 생성과 uid 업데이트
      voteBatch.set(voteRef, vote.toMap() as Map<String, dynamic>);
      voteBatch.update(voteRef, {'voteUid': voteRef.id});
      voteBatch.update(voteRef, {'postUid': postUid});

      for (int i = 0; i <= voteItemList.length - 1; i++) {
        // 투표 votes의 하위콜렉션에 개별 투표 답변목록 등록
        DocumentReference itemRef =
            _db.collection('votes').doc(voteUid).collection('voteItem').doc();
        voteBatch.set(itemRef, voteItemList[i].toMap() as Map<String, dynamic>);
        voteBatch.update(itemRef, {'itemUid': itemRef.id});
      }

      await voteBatch.commit().catchError((onError) {
        l.info(this, 'vote writeBatch batch catch error');
        l.info(onError, 'vote writeBatch batch catch onError');
      });
    } catch (e) {
      l.info(this, 'add vote error >> ' + e.toString());
      l.info(this, 'add vote error >> ' + e.runtimeType.toString());
    }
  }

  Future insertVoteUsers(String voteUid, String userId, String itemUid) async {
    WriteBatch voteCastBatch = _db.batch();
    DocumentReference ref = _db
        .collection('votes')
        .doc(voteUid)
        .collection('voteUsers')
        .doc(userId);
    voteCastBatch.set(ref, {
      'userId': authBloc.currentUserId,
      'voteUid': voteUid,
      'itemUid': itemUid
    });

    List<String> userIdArray = [userId];
    userIdArray.add(userId);
    voteCastBatch.update(
        _db
            .collection('votes')
            .doc(voteUid)
            .collection('voteItem')
            .doc(itemUid),
        {'voteUserArray': FieldValue.arrayUnion(userIdArray)});

    voteCastBatch.commit().catchError((onError) {
      l.info(this, 'voteCastBatch.commit catchError >> ');
      l.info(onError, 'voteCastBatch.commit Exception >> ');
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchVote(
      String voteUid) async {
    return _db.collection('votes').doc(voteUid).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getVoteItem(
      String voteUid) async {
    return _db
        .collection('votes')
        .doc(voteUid)
        .collection('voteItem')
        .orderBy('id', descending: false)
        .get();
  }

  Future editPost(AppPost post, String? postUid) async {
    _db.collection('posts').doc(postUid).update({
      'deleteImgPath': post.deleteImgPath,
      'imgDownload': post.imgDownload,
      'text': post.text,
      'title': post.title,
      'header': post.header.toString()
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getPost(String postId) async {
    return _db.collection('posts').doc(postId).get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> posts() {
    // return _db.collection('posts')snapshots();
    return _db
        .collection('posts')
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  // 내가 쓴 게시글 페이징
  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getFirstOwnerPost(
      String? ownerId) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docsList;
    docsList = (await _db
            .collection('posts')
            .where('ownerId', isEqualTo: ownerId)
            // .where('deleteFlag', isEqualTo: "N")
            .orderBy('createdAt', descending: true)
            .limit(15)
            .get())
        .docs;

    return docsList;
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getNextOwnerPost(
      String? ownerId,
      List<DocumentSnapshot<Map<String, dynamic>>> documentList) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docsList;
    docsList = (await _db
            .collection('posts')
            .where('ownerId', isEqualTo: ownerId)
            // .where('deleteFlag', isEqualTo: "N")
            .orderBy('createdAt', descending: true)
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(15)
            .get())
        .docs;

    return docsList;
  }

  String switchFilter(String filter) {
    String result = "";
    switch (filter) {
      case 'view':
        result = "viewCount";
        break;
      case 'reply':
        result = "replyCount";
        break;
      default:
        result = "createdAt";
        break;
    }
    return result;
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchFirstPost(
      String? requiredFilter,
      {String? filter,
      String? header,
      String? ownerId}) async {
    requiredFilter = switchFilter(requiredFilter!);
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docsList;
    if (header == null || header == 'all') {
      docsList = (await _db
              .collection("posts")
              .where('deleteFlag', isEqualTo: "N")
              .orderBy(requiredFilter, descending: true)
              // .orderBy("sequence", descending: true)
              .limit(15)
              .get())
          .docs;
    } else {
      docsList = (await _db
              .collection("posts")
              .where('deleteFlag', isEqualTo: "N")
              .where('header', isEqualTo: header.toString())
              .orderBy(requiredFilter, descending: true)
              // .orderBy("sequence", descending: true)
              .limit(15)
              .get())
          .docs;
    }
    return docsList;
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchNextPost(
      List<DocumentSnapshot<Map<String, dynamic>>> documentList,
      String? requiredFilter,
      {String? filter,
      String? header,
      String? ownerId}) async {
    l.info(this, 'fetchNextPost >> ');

    requiredFilter = switchFilter(requiredFilter!);
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docsList;
    if (header == null || header == 'all') {
      docsList = (await _db
              .collection("posts")
              .where('deleteFlag', isEqualTo: "N")
              .orderBy(requiredFilter, descending: true)
              // .orderBy("sequence", descending: true)
              .startAfterDocument(documentList[documentList.length - 1])
              .limit(15)
              .get())
          .docs;
    } else {
      docsList = (await _db
              .collection("posts")
              .where('deleteFlag', isEqualTo: "N")
              .where('header', isEqualTo: header.toString())
              .orderBy(requiredFilter, descending: true)
              // .orderBy("sequence", descending: true)
              .startAfterDocument(documentList[documentList.length - 1])
              .limit(15)
              .get())
          .docs;
    }
    return docsList;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostLikedBloc(
      String? ownerId) {
    return _db
        .collection('posts')
        .where('likeUsers', arrayContains: ownerId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getPushedPost(
      String? postUid) {
    return _db.collection('posts').doc(postUid).get();
  }

  Future castVote(AppVote vote, String itemUid, String voteUser) async {
    // 개별 투표 답변 카운트 +
    var ref = _db
        .collection('votes')
        .doc(vote.voteUid)
        .collection('voteItem')
        .doc(itemUid);
    // 총 투표 카운트 +
    var voteRef = _db.collection('votes').doc(vote.voteUid);

    await _db.runTransaction((transaction) async {
      var snapItem = await transaction.get(ref);
      var snapVote = await transaction.get(voteRef);

      if (snapItem.exists) {
        // 투표 답변 카운트 증가
        int voteCount = snapItem.data()!['count'] + 1;
        // 총 투표의 합 카운트 증가
        int totalCount = snapVote.data()!['voteCount'] + 1;

        transaction.update(ref, {
          'count': voteCount,
          'percent': ((voteCount / totalCount) * 100).toDouble()
        });
        transaction.update(voteRef, {'voteCount': totalCount});

        await calculateVote(vote, totalCount: totalCount);
      } else {
        throw Exception('voteItem count plus failed');
      }
      // 투표한 사용자
      await insertVoteUsers(vote.voteUid!, voteUser, itemUid);
    });
    // 트랜잭션 종료
  }

  Future calculateVote(AppVote vote, {int? totalCount}) async {
    // 업데이트해줘야될 개별 아이템 ref

    // 퓨쳐 사용
    var listQs = await Future.wait([
      _db.collection('votes').doc(vote.voteUid).collection('voteItem').get()
    ]);
    // print('갱신된 최종 총 투표수 >> ' + totalCount.toString());

    await _db.runTransaction((transaction) async {
      for (var element in listQs) {
        for (var docsElement in element.docs) {
          if (docsElement.data()['count'] != 0) {
            var updateItemRef = _db
                .collection('votes')
                .doc(vote.voteUid)
                .collection('voteItem')
                .doc(docsElement.id);
            transaction.update(updateItemRef, {
              'percent': ((docsElement.data()['count'] / totalCount) *
                  (100).toDouble())
            });
          }
        }
      }
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getReplyStream(
      {String? postUid, String? ownerId}) {
    return _db
        .collection('reply')
        //.where('deleteFlag', isEqualTo: "N")
        .where(postUid != null ? 'postUid' : 'ownerId',
            isEqualTo: postUid ?? ownerId)
        .orderBy("createDate", descending: ownerId != null ? true : false)
        .snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getReplyParentPost(
      String postUid) {
    return _db.collection('posts').doc(postUid).get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getReReplyStream(
      String? replyUid) {
    // 대댓글 가져오기
    return _db
        .collection('reply')
        .doc(replyUid)
        .collection('rereply')
        // 삭제여부 상관없이 가져옴
        // .where('deleteFlag', isEqualTo: "N")
        .orderBy("createDate", descending: false)
        .snapshots();
  }

  Future increasePostLike(String? postUid, String? userId) async {
    // 플러스 +1
    DocumentReference ref = _db.collection('posts').doc(postUid);

    await _db.runTransaction((transaction) async {
      var snap = await transaction.get(ref);
      if (snap.exists) {
        int currentCount = snap.get('likeCount') + 1;
        transaction.update(ref, {'likeCount': currentCount});
        // ??
        // insertUserIdToArray(ref, postUid, userId);

        // addPostLikeUser(postUid, userId, ref);
        transaction.set(ref.collection('likeUser').doc(userId),
            {'userId': authBloc.currentUserId, 'postUid': postUid});
      }
    }).catchError((e) {
      l.info(this, 'catchError >>');
    }).whenComplete(() {});
  }

  Future decreasePostLike(String? postUid, String? userId) async {
    // 마이너스 -1
    DocumentReference ref = _db.collection('posts').doc(postUid);

    await _db.runTransaction((transaction) async {
      var snap = await transaction.get(ref);
      // 좋아요 마이너스 -1
      if (snap.exists) {
        int currentCount = snap.get('likeCount') - 1;

        try {
          // ref.collection('likeUser').doc(userId).delete();
          // 수정
          transaction.update(ref, {'likeCount': currentCount});
          transaction.delete(ref.collection('likeUser').doc(userId));
          // removeUserIdFromArray(ref, postUid, userId);
        } catch (e) {
          l.info(this, 'catch E >> ' + e.toString());
        }
      }
    }).catchError((e) {
      l.info(this, 'catchError >>>>>' + e.toString());
    }).whenComplete(() {});
  }

  // Future removeUserIdFromArray(
  //     DocumentReference? ref, String? postUid, String? userId) async {
  //   DocumentReference ref = _db.collection('posts').doc(postUid);
  //   List<String> userIdArray = [userId.toString()];
  //   userIdArray.add(userId.toString());

  //   await _db.runTransaction((transaction) async {
  //     transaction
  //         .update(ref, {'likeUsers': FieldValue.arrayRemove(userIdArray)});
  //   });
  // }

  Future<bool> ifExistLike(String? postUid, String userId) {
    //좋아요 한적 있는지 체크

    var isExists = (DocumentSnapshot doc) => doc.exists;
    l.info(this, 'ifExistLike userid >>> ' + userId);

    return Future.wait([
      _db
          .collection('posts')
          .doc(postUid)
          .collection('likeUser')
          .doc(userId)
          .get()
          .then(isExists),
    ]).then((xs) {
      l.info(this, 'Future like before bool then xs >> ' + xs.toString());
      // 존재함
      return xs.every((x) => x == true);
    });
  }

  Future<bool> ifExistVote(String? voteUid, String userId) {
    //투표 한적 있는지 체크
    var isExists = (DocumentSnapshot doc) => doc.exists;

    return Future.wait([
      _db
          .collection('votes')
          .doc(voteUid)
          .collection('voteUsers')
          .doc(userId)
          .get()
          .then(isExists),
    ]).then((xs) {
      l.info(this, 'Future ifExistVote bool then xs >> ' + xs.toString());
      // 존재함
      return xs.every((x) => x == true);
    });
  }

  Future addPostLikeUser(String? postUid, String? userId, var ref) {
    return ref
        .collection('likeUser')
        .doc(userId)
        .set({'userId': authBloc.currentUserId, 'postUid': postUid});
  }

  Future removePost(DocumentReference ref, {String? postUid}) async {
    // 리플과 대댓글에 대한 삭제처리..
    // await ref.delete();
    await ref.update({'deleteFlag': 'Y'});
  }

  Future removeAppPost(DocumentReference ref, {String? postUid}) async {
    // 원문글의 삭제처리//
    await ref.update({'deleteFlag': 'Y'});

    // 원문글이 삭제될때 그안에 달린 댓글의 삭제
    // await removeReplyArray(postUid: postUid);
  }

  //본문 참조하고있는 댓글 삭제
  Future removeReplyArray({String? postUid}) async {
    Stream<QuerySnapshot<Map<String, dynamic>>> qs = _db
        .collection('reply')
        .where('postUid', isEqualTo: postUid)
        .snapshots();

    qs.forEach((element) {
      for (var qs in element.docs) {
        // 실제로 삭제
        // qs.reference.delete();
        //update로 변경
        qs.reference.update({'deleteFlag': 'Y'});
      }
    });
    // 대댓글에 대한 처리도 필요..
  }

  // 조회수 증가
  Future increaseField(DocumentReference ref, {String? field, int? value}) {
    // ref 경로의 문서 필드 +1 or -1

    return _db.runTransaction((transaction) async {
      var snap = await transaction.get(ref);
      if (snap.exists) {
        int currentCount = snap.get(field) + 1;
        transaction.update(ref, {field!: FieldValue.increment(value!)});
      }
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFaqs() {
    return _db.collection('faqs').snapshots();
  }

  Future addQna(String? userId, Map data) async {
    return _db.collection('qnas').doc().set(data as Map<String, dynamic>);
  }
}
