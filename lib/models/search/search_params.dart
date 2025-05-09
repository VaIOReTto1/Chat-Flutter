/// 搜索参数
class SearchParams {
  /// 会话 ID
  String? conversationID;

  /// 消息 ID 列表
  List<String>? clientMsgIDList;

  SearchParams({
    this.conversationID,
    this.clientMsgIDList,
  });

  SearchParams.fromJson(Map<String, dynamic> json) {
    conversationID = json['conversationID'];
    if (json['clientMsgIDList'] != null) {
      clientMsgIDList = json['clientMsgIDList'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['conversationID'] = conversationID;
    data['clientMsgIDList'] = clientMsgIDList;
    return data;
  }
}