import 'dart:convert';

import '../enum/conversation_type.dart';
import 'message/Message.dart';

/// 会话信息模型类
class ConversationInfo {
  /// 会话的唯一标识符
  String conversationID;

  /// 会话类型（例如：单聊、群聊、超级群聊）
  int? conversationType;

  /// 单聊情况下的用户 ID
  String? userID;

  /// 群聊情况下的群组 ID
  String? groupID;

  /// 显示名称或昵称
  String? showName;

  /// 用户或群组的头像 URL
  String? faceURL;

  /// 消息接收选项（0：正常接收，1：不接收消息，2：仅接收在线消息，不接收离线消息）
  int? recvMsgOpt;

  /// 会话中的未读消息数量
  int unreadCount = 0;

  /// 会话中的最新消息
  Message? latestMsg;

  /// 最新消息的发送时间戳
  int? latestMsgSendTime;

  /// 会话的草稿文本
  String? draftText;

  /// 草稿文本的创建时间戳
  int? draftTextTime;

  /// 是否置顶会话
  bool? isPinned;

  /// 是否为私密聊天
  bool? isPrivateChat;

  /// 消息可读时长（单位：秒）
  int? burnDuration;

  /// 是否启用消息销毁功能
  bool? isMsgDestruct;

  /// 消息销毁时间戳
  int? msgDestructTime;

  /// 附加数据或元数据
  String? ex;

  /// 用户是否不在群组中（适用于群聊）
  bool? isNotInGroup;

  /// 群组 @ 类型，包括 @所有人、@个人、@公告提示等
  int? groupAtType;

  /// 构造函数，用于创建 ConversationInfo 对象
  ConversationInfo({
    required this.conversationID,
    this.conversationType,
    this.userID,
    this.groupID,
    this.showName,
    this.faceURL,
    this.recvMsgOpt,
    this.unreadCount = 0,
    this.latestMsg,
    this.latestMsgSendTime,
    this.draftText,
    this.draftTextTime,
    this.isPrivateChat,
    this.burnDuration,
    this.isPinned,
    this.isNotInGroup,
    this.ex,
    this.groupAtType,
    this.isMsgDestruct,
    this.msgDestructTime,
  });

  /// 从 JSON 数据创建 ConversationInfo 对象
  ConversationInfo.fromJson(Map<String, dynamic> json)
      : conversationID = json['conversationID'] {
    conversationType = json['conversationType'];
    userID = json['userID'];
    groupID = json['groupID'];
    showName = json['showName'];
    faceURL = json['faceURL'];
    recvMsgOpt = json['recvMsgOpt'];
    unreadCount = json['unreadCount'];
    try {
      if (json['latestMsg'] is String) {
        latestMsg = Message.fromJson(jsonDecode(json['latestMsg']));
      } else if (json['latestMsg'] is Map) {
        latestMsg = Message.fromJson(json['latestMsg']);
      }
    } catch (e) {}
    latestMsgSendTime = json['latestMsgSendTime'];
    draftText = json['draftText'];
    draftTextTime = json['draftTextTime'];
    isPinned = json['isPinned'];
    isPrivateChat = json['isPrivateChat'];
    burnDuration = json['burnDuration'];
    isNotInGroup = json['isNotInGroup'];
    groupAtType = json['groupAtType'];
    ex = json['ex'];
    isMsgDestruct = json['isMsgDestruct'];
    msgDestructTime = json['msgDestructTime'];
  }

  /// 将 ConversationInfo 对象转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['conversationID'] = conversationID;
    data['conversationType'] = conversationType;
    data['userID'] = userID;
    data['groupID'] = groupID;
    data['showName'] = showName;
    data['faceURL'] = faceURL;
    data['recvMsgOpt'] = recvMsgOpt;
    data['unreadCount'] = unreadCount;
    data['latestMsg'] = latestMsg?.toJson();
    data['latestMsgSendTime'] = latestMsgSendTime;
    data['draftText'] = draftText;
    data['draftTextTime'] = draftTextTime;
    data['isPinned'] = isPinned;
    data['isPrivateChat'] = isPrivateChat;
    data['burnDuration'] = burnDuration;
    data['isNotInGroup'] = isNotInGroup;
    data['groupAtType'] = groupAtType;
    data['ex'] = ex;
    data['isMsgDestruct'] = isMsgDestruct;
    data['msgDestructTime'] = msgDestructTime;
    return data;
  }

  /// 判断是否为单聊
  bool get isSingleChat => conversationType == ConversationType.single;

  /// 判断是否为群聊
  bool get isGroupChat =>
      conversationType == ConversationType.superGroup;

  /// 判断会话是否有效（单聊或群聊且用户不在群组中）
  bool get isValid => isSingleChat || (isGroupChat && !isNotInGroup!);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ConversationInfo &&
              runtimeType == other.runtimeType &&
              conversationID == other.conversationID;

  @override
  int get hashCode => conversationID.hashCode;
}
