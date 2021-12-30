import 'dart:io';
import 'dart:typed_data';

import 'package:application/repositories/repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

mixin CloudStorageRepository on BaseRepository {
  static const String jpegMime = 'image/jpeg';
  static const String pngMime = 'image/png';
  static const String m4aMime = 'audio/m4a';
  static const String mp3Mime = 'audio/mpeg3';
  static const String wavMime = 'audio/wav';

  Stream<TaskSnapshot> uploadUserProfileImage(String? userId, File file) {
    UploadTask task = uploadUserProfileImageTask(userId, file);
    return task.snapshotEvents;
  }

  UploadTask uploadUserProfileImageTask(String? userId, File file) {
    return cloudStorageApi.uploadFile(
        'images/profiles/$userId/user_profile_${DateTime.now().millisecondsSinceEpoch}.jpeg',
        file,
        metaData: SettableMetadata(contentType: jpegMime));
  }

  Future deleteProfileImage(String path) {
    return cloudStorageApi.deleteFile(
      path,
    );
  }

  Stream<TaskSnapshot> uploadProfileCertificationImage(
      String? userId, File file) {
    UploadTask task = uploadProfileCertificationImageTask(userId, file);
    return task.snapshotEvents;
  }

  UploadTask uploadProfileCertificationImageTask(String? userId, File file) {
    return cloudStorageApi.uploadFile(
        'images/profileCertifications/$userId/profile_certification.jpeg', file,
        metaData: SettableMetadata(contentType: jpegMime));
  }

  Stream<TaskSnapshot> uploadMeetCoverImage(String? meetId, File file) {
    UploadTask task = uploadMeetCoverImageTask(meetId, file);
    return task.snapshotEvents;
  }

  UploadTask uploadMeetCoverImageTask(String? meetId, File file) {
    return cloudStorageApi.uploadFile(
        'images/meets/$meetId/meet_cover_${DateTime.now().millisecondsSinceEpoch}.jpeg',
        file,
        metaData: SettableMetadata(contentType: jpegMime));
  }

  Stream<TaskSnapshot> uploadMessageImage(
      String? chatRoomId, String? userId, File file) {
    UploadTask task = uploadMessageImageTask(chatRoomId, userId, file);
    return task.snapshotEvents;
  }

  UploadTask uploadMessageImageTask(
      String? chatRoomId, String? userId, File file) {
    return cloudStorageApi.uploadFile(
        'images/chatRooms/$chatRoomId/${chatRoomId}_${userId}_${DateTime.now().millisecondsSinceEpoch}.jpeg',
        file,
        metaData: SettableMetadata(contentType: jpegMime));
  }

  Stream<TaskSnapshot> uploadPostAudio(String userId, File file) {
    UploadTask task = uploadPostAudioTask(userId, file);
    return task.snapshotEvents;
  }

  UploadTask uploadPostAudioTask(String userId, File file) {
    return cloudStorageApi.uploadFile(
        'audios/users/$userId/short_post_audio/short_post_${DateTime.now().millisecondsSinceEpoch}.wav',
        file,
        metaData: SettableMetadata(contentType: wavMime));
  }

  Stream<TaskSnapshot> uploadRoomBackgroundImage(String userId, File file) {
    UploadTask task = uploadRoomBackgroundImageTask(userId, file);
    return task.snapshotEvents;
  }

  UploadTask uploadRoomBackgroundImageTask(String userId, File file) {
    return cloudStorageApi.uploadFile(
        'images/users/$userId/room_backgrounds/room_bg_${DateTime.now().millisecondsSinceEpoch}.jpeg',
        file,
        metaData: SettableMetadata(contentType: jpegMime));
  }

  Future<String> downloadUrl(String path) => cloudStorageApi.downloadUrl(path);
  Future<Uint8List?> downloadData(String path) =>
      cloudStorageApi.downloadData(path);

  Future<List<String>> poses() {
    return cloudStorageApi.poses().then((value) {
      var data = value.items.map((x) => x.fullPath).toList();
      return data;
    });
  }

  Future<Map<String, dynamic>> uploadPostPhoto(
      String? userId, File imageFile) async {
    Reference ref = FirebaseStorage.instance.ref().child(
        'images/postImage/$userId/fileNo_${DateTime.now().millisecondsSinceEpoch}.jpeg');
    UploadTask uploadTask = ref.putFile(imageFile);
    var downUrl =
        await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();

    Map<String, dynamic> dataMap = {
      'downUrl': downUrl,
      'fullPath': ref.fullPath.toString()
    };
    l.info(this, 'downUrl >>' + downUrl);
    l.info(this, 'fullPath >>' + dataMap['fullPath']);
    return dataMap;
  }

  Future deletePostImage(String path) {
    return cloudStorageApi.deleteFile(
      path,
    );
  }

  Future clearImageCache(String imgPath) async {
    // var file = await FirebaseCacheManager().getSingleFile(post.deleteImgPath);
    // await file.delete();
    // await FirebaseStorage.instance.ref().child(this.post.deleteImgPath).delete();

    print('imagePath >> ' + imgPath);

    await CachedNetworkImage.evictFromCache(imgPath);
  }
}
