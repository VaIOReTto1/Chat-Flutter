import 'Message.dart';
import 'at_user_info.dart';

/// @ 提及消息内容
class AtTextElem {
  /// 消息内容
  String? text;

  /// 被提及的用户 ID 列表
  List<String>? atUserList;

  /// 是否包含对自己的提及
  bool? isAtSelf;

  /// 被提及的用户信息列表，用于在消息内容中替换用户 ID 为昵称
  List<AtUserInfo>? atUsersInfo;

  /// 被回复的消息，当回复某人并提及其他人时使用
  Message? quoteMessage;

  /// 构造函数
  AtTextElem({
    this.text,
    this.atUserList,
    this.isAtSelf,
    this.atUsersInfo,
    this.quoteMessage,
  });

  /// 从 JSON 数据创建 AtTextElem 实例
  AtTextElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['atUserList'] is List) {
      atUserList = (json['atUserList'] as List).map((e) => '$e').toList();
    }
    isAtSelf = json['isAtSelf'];
    if (json['atUsersInfo'] is List) {
      atUsersInfo = (json['atUsersInfo'] as List).map((e) => atUsersInfo?.fromJson(e)).toList();
    }
    quoteMessage = null != json['quoteMessage'] ? Message.fromJson(json['quoteMessage']) : null;
  }

  /// 将 AtTextElem 实例转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['atUserList'] = atUserList;
    data['isAtSelf'] = isAtSelf;
    data['atUsersInfo'] = atUsersInfo?.map((e) => e.toJson()).toList();
    data['quoteMessage'] = quoteMessage?.toJson();
    return data;
  }
}