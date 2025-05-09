import 'Message.dart';

/// 高级消息列表
class AdvancedMessage {
  /// 消息列表
  List<Message>? messageList;

  /// 是否为最后一页
  bool? isEnd;

  /// 错误码
  int? errCode;

  /// 错误信息
  String? errMsg;

  /// 最后一条消息的最小序列号
  int? lastMinSeq;

  AdvancedMessage({
    this.messageList,
    this.isEnd,
    this.errCode,
    this.errMsg,
    this.lastMinSeq,
  });

  AdvancedMessage.fromJson(Map<String, dynamic> json) {
    messageList = json['messageList'] == null
        ? null
        : (json['messageList'] as List)
        .map((e) => Message.fromJson(e))
        .toList();
    isEnd = json['isEnd'];
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    lastMinSeq = json['lastMinSeq'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['messageList'] = messageList?.map((e) => e.toJson()).toList();
    data['isEnd'] = isEnd;
    data['errCode'] = errCode;
    data['errMsg'] = errMsg;
    data['lastMinSeq'] = lastMinSeq;
    return data;
  }
}