/// 消息撤回详情
class RevokedInfo {
  /// 撤回者ID
  String? revokerID;

  /// 撤回者在群中的角色 [GroupRoleLevel]
  int? revokerRole;

  /// 撤回者昵称
  String? revokerNickname;

  /// 被撤回的消息ID
  String? clientMsgID;

  /// 撤回时间
  int? revokeTime;

  /// 原消息发送时间
  int? sourceMessageSendTime;

  /// 原消息发送者ID
  String? sourceMessageSendID;

  /// 原消息发送者昵称
  String? sourceMessageSenderNickname;

  /// 会话类型 [ConversationType]
  int? sessionType;

  RevokedInfo({
    this.revokerID,
    this.revokerRole,
    this.revokerNickname,
    this.clientMsgID,
    this.revokeTime,
    this.sourceMessageSendTime,
    this.sourceMessageSendID,
    this.sourceMessageSenderNickname,
    this.sessionType,
  });

  RevokedInfo.fromJson(Map<String, dynamic> json) {
    revokerID = json['revokerID'];
    revokerRole = json['revokerRole'];
    revokerNickname = json['revokerNickname'];
    clientMsgID = json['clientMsgID'];
    revokeTime = json['revokeTime'];
    sourceMessageSendTime = json['sourceMessageSendTime'];
    sourceMessageSendID = json['sourceMessageSendID'];
    sourceMessageSenderNickname = json['sourceMessageSenderNickname'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['revokerID'] = revokerID;
    data['revokerRole'] = revokerRole;
    data['revokerNickname'] = revokerNickname;
    data['clientMsgID'] = clientMsgID;
    data['revokeTime'] = revokeTime;
    data['sourceMessageSendTime'] = sourceMessageSendTime;
    data['sourceMessageSendID'] = sourceMessageSendID;
    data['sourceMessageSenderNickname'] = sourceMessageSenderNickname;
    data['sessionType'] = sessionType;
    return data;
  }
}