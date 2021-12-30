library app_post;

enum AppNoticeTypeEnum {
  notice,
  post,
  match,
  meeting,
  message,
  schedule,
  unknown
}
enum AppNoticeSubTypeEnum {
  personal,
  event,
  notification,
  post,
  relply,
  rerelply,
  like,
  superlike,
  superapply,
  apply,
  userlike,
  match,
  invite,
  approve,
  meeting,
  reject,
  groupmessage,
  home_member_approve,
  unknown
}

class AppNoticeType {
  final AppNoticeTypeEnum type;
  final AppNoticeSubTypeEnum subType;
  AppNoticeType(this.type, this.subType);
}
