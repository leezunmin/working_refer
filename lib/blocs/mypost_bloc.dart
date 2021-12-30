import 'dart:async';
import 'dart:io';
import 'package:application/blocs/blocs.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mypost_bloc_base.dart';

// 마이페이지에서만 사용함
class MyPostBloc extends MyPostBlocBase {
  final _addEvent = StreamController();
  Sink get addEvent => _addEvent;
  late final Repository repo;

  MyPostBloc(this.repo) : super() {
    l.info(this, 'RxDart CommunityBloc >> Constructor >>');

    _addEvent.stream.listen((action) {
      l.info(this, 'bloc event >>' + action.toString());
      switch (action.runtimeType) {
        /* case TagEvent:
          eventToTag(action);
          break;*/
        default:
          assert(false);
      }
    });
  }

  Future getFirstOwnerPost() async {
    l.info(this, 'getFirstOwnerPost() >>>');
    try {
      ownerDocumentList = await repo.getFirstOwnerPost(ownerIdSub.value);
      List<AppPost> postList = [];
      if (ownerDocumentList.isEmpty) {
        getOwnerPostSub.sink.addError("No Data Available");
      }
      for (var element in ownerDocumentList) {
        postList.add(AppPost.fromMap(element.data()!)!);
      }
      getOwnerPostSub.sink.add(postList);
    } on SocketException {
      getOwnerPostSub.sink
          .addError(const SocketException("No Internet Connection"));
    } catch (e) {
      l.info(this, e.toString());
      getOwnerPostSub.sink.addError(e);
    }
  }

  Future getNextOwnerPost() async {
    l.info(this, 'getNextOwnerPost() >>>');
    try {
      List<DocumentSnapshot<Map<String, dynamic>>> nextDocumentList =
          await repo.getNextOwnerPost(ownerIdSub.value, ownerDocumentList);
      ownerDocumentList.addAll(nextDocumentList);
      List<AppPost> postList = [];
      if (ownerDocumentList.isEmpty) {
        getOwnerPostSub.sink.addError("No Data Available");
      }
      for (var element in ownerDocumentList) {
        postList.add(AppPost.fromMap(element.data()!)!);
      }
      getOwnerPostSub.sink.add(postList);
    } on SocketException {
      getOwnerPostSub.sink
          .addError(const SocketException("No Internet Connection"));
    } catch (e) {
      l.info(this, e.toString());
      getOwnerPostSub.sink.addError(e);
    }
  }

  Stream<List<AppPost?>>? getPostLikedStream() {
    try {
      return repo.getPostLikedBloc(ownerIdSub.value);
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<AppReply?>>? getReplyStream() {
    try {
      return repo.getReplyStream(ownerId: ownerIdSub.value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  dispose() {
    l.info(this, '>> RxDart CommunityBloc dispose() >>');
    ownerIdSub.close();
    getOwnerPostSub.close();
    _addEvent.close();
    super.dispose();
  }
}
