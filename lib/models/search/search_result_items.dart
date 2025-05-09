import '../message/Message.dart';

/// 搜索结果项
class SearchResultItems {
  /// 会话 ID
  String? conversationID;

  /// 会话类型：1 单聊，2 群聊，3 超级群聊，4 通知会话
  int? conversationType;

  /// 显示名称
  String? showName;

  /// 头像
  String? faceURL;

  /// 在该会话中找到的消息数量
  int? messageCount;

  /// 消息列表
  List<Message>? messageList;

  SearchResultItems({this.conversationID, this.messageCount, this.messageList});

  SearchResultItems.fromJson(Map<String, dynamic> json) {
    conversationID = json['conversationID'];
    conversationType = json['conversationType'];
    showName = json['showName'];
    faceURL = json['faceURL'];
    messageCount = json['messageCount'];
    if (json['messageList'] != null) {
      messageList = <Message>[];
      json['messageList'].forEach((v) {
        messageList!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['conversationID'] = conversationID;
    data['conversationType'] = conversationType;
    data['showName'] = showName;
    data['faceURL'] = faceURL;
    data['messageCount'] = messageCount;
    if (messageList != null) {
      data['messageList'] = messageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}