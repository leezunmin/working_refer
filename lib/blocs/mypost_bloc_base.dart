import 'package:application/models/models.dart';
import 'package:application/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class MyPostBlocBase with LogMixin {
  final ownerIdSub = BehaviorSubject<String>();
  Function(String) get setownerId => ownerIdSub.sink.add;
  BehaviorSubject<List<AppPost>> getOwnerPostSub =
      BehaviorSubject<List<AppPost>>();

  late List<DocumentSnapshot<Map<String, dynamic>>> documentList;
  late List<DocumentSnapshot<Map<String, dynamic>>> ownerDocumentList;

  MyPostBlocBase() {}

  dispose() {}
}
