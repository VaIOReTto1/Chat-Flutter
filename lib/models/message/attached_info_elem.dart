import 'group_has_read_info.dart';

/// 附加信息
class AttachedInfoElem {
  /// 群组消息已读信息
  GroupHasReadInfo? groupHasReadInfo;

  /// 是否为私聊消息（阅后即焚消息），仅对一对一聊天有效
  bool? isPrivateChat;

  /// 已读时间
  int? hasReadTime;

  /// 阅读时长（秒）
  /// 即从 hasReadTime 时间起，经过 burnDuration 秒后触发销毁
  int? burnDuration;

  /// 不发送离线推送通知
  bool? notSenderNotificationPush;

  AttachedInfoElem({
    this.groupHasReadInfo,
    this.isPrivateChat,
    this.hasReadTime,
    this.burnDuration,
    this.notSenderNotificationPush,
  });

  AttachedInfoElem.fromJson(Map<String, dynamic> json) {
    groupHasReadInfo = json['groupHasReadInfo'] == null ? null : groupHasReadInfo?.fromJson(json['groupHasReadInfo']);
    isPrivateChat = json['isPrivateChat'];
    hasReadTime = json['hasReadTime'];
    burnDuration = json['burnDuration'];
    notSenderNotificationPush = json['notSenderNotificationPush'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupHasReadInfo'] = groupHasReadInfo?.toJson();
    data['isPrivateChat'] = isPrivateChat;
    data['hasReadTime'] = hasReadTime;
    data['burnDuration'] = burnDuration;
    data['notSenderNotificationPush'] = notSenderNotificationPush;
    return data;
  }
}
