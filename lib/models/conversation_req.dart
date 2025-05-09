class ConversationReq {
  /// 用户 ID
  final String? userID;

  /// 群组 ID
  final String? groupID;

  /// 消息接收选项
  final int? recvMsgOpt;

  /// 是否置顶
  final bool? isPinned;

  /// 是否为私聊
  final bool? isPrivateChat;

  /// 扩展信息
  final String? ex;

  /// 焚烧时间
  final int? burnDuration;

  /// 是否启用消息销毁
  final bool? isMsgDestruct;

  /// 消息销毁时间
  final int? msgDestructTime;

  /// 群组 @ 类型
  final int? groupAtType;

  ConversationReq({
    this.userID,
    this.groupID,
    this.recvMsgOpt,
    this.isPinned,
    this.isPrivateChat,
    this.ex,
    this.burnDuration,
    this.isMsgDestruct,
    this.msgDestructTime,
    this.groupAtType,
  });

  ConversationReq.fromJson(Map<String, dynamic> json)
      : userID = json['userID'],
        groupID = json['groupID'],
        recvMsgOpt = json['recvMsgOpt'],
        isPinned = json['isPinned'],
        isPrivateChat = json['isPrivateChat'],
        ex = json['ex'],
        burnDuration = json['burnDuration'],
        isMsgDestruct = json['isMsgDestruct'],
        msgDestructTime = json['msgDestructTime'],
        groupAtType = json['groupAtType'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['groupID'] = groupID;
    data['recvMsgOpt'] = recvMsgOpt;
    data['isPinned'] = isPinned;
    data['isPrivateChat'] = isPrivateChat;
    data['ex'] = ex;
    data['burnDuration'] = burnDuration;
    data['isMsgDestruct'] = isMsgDestruct;
    data['msgDestructTime'] = msgDestructTime;
    data['groupAtType'] = groupAtType;

    return data;
  }
}