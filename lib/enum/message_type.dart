/// 消息类型
class MessageType {
  /// 普通文本
  static const text = 101;

  /// 图片
  static const picture = 102;

  /// 语音
  static const voice = 103;

  /// 视频
  static const video = 104;

  /// 文件
  static const file = 105;

  /// @ 消息
  static const atText = 106;

  /// 合并消息
  static const merger = 107;

  /// 名片
  static const card = 108;

  /// 位置
  static const location = 109;

  /// 自定义
  static const custom = 110;

  /// 正在输入
  static const typing = 113;

  /// 引用回复
  static const quote = 114;

  /// 自定义表情
  static const customFace = 115;

  /// 群消息已读回执（v3 已废弃，使用 GroupHasReadReceiptNotification）
  @Deprecated('Use GroupHasReadReceiptNotification instead')
  static const groupHasReadReceipt = 116;

  /// 富文本消息
  static const advancedText = 117;

  /// 自定义消息，不触发会话
  static const customMsgNotTriggerConversation = 119;

  /// 自定义消息，仅在线推送
  static const customMsgOnlineOnly = 120;

  /// 通知类型起始
  static const notificationBegin = 1000;

  /// 好友通知类型起始
  static const friendNotificationBegin = 1200;

  /// 好友申请已通过
  static const friendApplicationApprovedNotification = 1201;

  /// 好友申请被拒绝
  static const friendApplicationRejectedNotification = 1202;

  /// 好友申请
  static const friendApplicationNotification = 1203;

  /// 已添加好友
  static const friendAddedNotification = 1204;

  /// 好友已删除
  static const friendDeletedNotification = 1205;

  /// 设置好友备注
  static const friendRemarkSetNotification = 1206;

  /// 添加到黑名单
  static const blackAddedNotification = 1207;

  /// 从黑名单移除
  static const blackDeletedNotification = 1208;

  /// 好友通知类型结束
  static const friendNotificationEnd = 1299;

  /// 会话变更通知
  static const conversationChangeNotification = 1300;

  /// 用户通知类型起始
  static const userNotificationBegin = 1301;

  /// 用户信息更新通知
  static const userInfoUpdatedNotification = 1303;

  /// 用户通知类型结束
  static const userNotificationEnd = 1399;

  /// OA 通知
  static const oaNotification = 1400;

  /// 群组通知类型起始
  static const groupNotificationBegin = 1500;

  /// 群组创建通知
  static const groupCreatedNotification = 1501;

  /// 群信息设置通知
  static const groupInfoSetNotification = 1502;

  /// 加群申请通知
  static const joinGroupApplicationNotification = 1503;

  /// 群成员退出通知
  static const memberQuitNotification = 1504;

  /// 群申请通过通知
  static const groupApplicationAcceptedNotification = 1505;

  /// 群申请拒绝通知
  static const groupApplicationRejectedNotification = 1506;

  /// 群主转移通知
  static const groupOwnerTransferredNotification = 1507;

  /// 群成员被踢通知
  static const memberKickedNotification = 1508;

  /// 群成员被邀请通知
  static const memberInvitedNotification = 1509;

  /// 群成员加入通知
  static const memberEnterNotification = 1510;

  /// 解散群组通知
  static const dismissGroupNotification = 1511;

  /// 群组通知类型结束
  static const groupNotificationEnd = 1599;

  /// 群成员被禁言通知
  static const groupMemberMutedNotification = 1512;

  /// 群成员取消禁言通知
  static const groupMemberCancelMutedNotification = 1513;

  /// 群组被禁言通知
  static const groupMutedNotification = 1514;

  /// 取消群组禁言通知
  static const groupCancelMutedNotification = 1515;

  /// 群成员信息变更通知
  static const groupMemberInfoChangedNotification = 1516;

  /// 群成员设为管理员通知
  static const groupMemberSetToAdminNotification = 1517;

  /// 群成员设为普通成员通知
  static const groupMemberSetToOrdinaryUserNotification = 1518;

  /// 群公告设置通知
  static const groupInfoSetAnnouncementNotification = 1519;

  /// 群名称变更通知
  static const groupInfoSetNameNotification = 1520;

  /// 阅后即焚通知
  static const burnAfterReadingNotification = 1701;

  /// 通知类型结束
  static const notificationEnd = 2000;

  /// 业务通知
  static const businessNotification = 2001;

  /// 消息撤回通知
  static const revokeMessageNotification = 2101;

  /// 单聊已读回执
  static const signalHasReadReceiptNotification = 2150;

  /// 群聊已读回执
  static const groupHasReadReceiptNotification = 2155;
}
