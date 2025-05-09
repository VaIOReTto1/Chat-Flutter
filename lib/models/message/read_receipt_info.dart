/// 消息已读回执信息
class ReadReceiptInfo {
  /// 用户 ID
  String? userID;

  /// 群组 ID
  String? groupID;

  /// 已读消息的 clientMsgID 列表
  List<String>? msgIDList;

  /// 已读时间
  int? readTime;

  /// 消息来源
  int? msgFrom;

  /// 消息类型
  int? contentType;

  /// 会话类型
  int? sessionType;

  ReadReceiptInfo({
    this.userID,
    this.groupID,
    this.msgIDList,
    this.readTime,
    this.msgFrom,
    this.contentType,
    this.sessionType,
  });

  ReadReceiptInfo.fromJson(Map<String, dynamic> json) {
    userID = json['uid'] ?? json['userID'];
    groupID = json['groupID'];
    if (json['msgIDList'] is List) {
      msgIDList = (json['msgIDList'] as List).map((e) => '$e').toList();
    }
    readTime = json['readTime'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['msgIDList'] = msgIDList;
    data['readTime'] = readTime;
    data['msgFrom'] = msgFrom;
    data['contentType'] = contentType;
    data['sessionType'] = sessionType;
    return data;
  }
}