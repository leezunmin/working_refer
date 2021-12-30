import 'package:application/repositories/repository.dart';

mixin InstaRestRepositoryMixin on BaseRepository {
  Future<String?> getMediaUrl(String? mediaId, String? accessToken) {
    return instaRestApi.getInstaMediaUrl(mediaId, accessToken);
  }
}
