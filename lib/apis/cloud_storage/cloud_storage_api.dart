import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageApi {
  final FirebaseStorage _db;
  CloudStorageApi(this._db);

  UploadTask uploadData(String path, Uint8List data,
          {SettableMetadata? metaData}) =>
      _db.ref().child(path).putData(data, metaData);

  UploadTask uploadFile(String path, File file, {SettableMetadata? metaData}) =>
      _db.ref().child(path).putFile(file, metaData);

  Future deleteFile(String path) => _db.ref().child(path).delete();

  Future<Uint8List?> downloadData(String path) =>
      _db.ref().child(path).getData(1024 * 1024 * 10);

  Future<String> downloadUrl(String path) =>
      _db.ref().child(path).getDownloadURL();

  Future<ListResult> poses() => _db.ref().child('images/poses').listAll();
}
