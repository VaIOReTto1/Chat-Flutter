import '../../models/message/Message.dart';
import '../../models/message/read_receipt_info.dart';
import '../../models/message/revoked_info.dart';

/// 高级消息监听器
class OnAdvancedMsgListener {
  /// 消息被删除回调
  Function(Message msg)? onMsgDeleted;

  /// 收到新撤回消息回调
  Function(RevokedInfo info)? onNewRecvMessageRevoked;

  /// 收到 C2C 已读回执回调
  Function(List<ReadReceiptInfo> list)? onRecvC2CReadReceipt;

  /// 收到新消息回调
  Function(Message msg)? onRecvNewMessage;

  /// 收到离线新消息回调
  Function(Message msg)? onRecvOfflineNewMessage;

  /// 收到仅在线消息回调
  Function(Message msg)? onRecvOnlineOnlyMessage;

  /// 唯一标识 ID
  String id;

  OnAdvancedMsgListener({
    this.onMsgDeleted,
    this.onNewRecvMessageRevoked,
    this.onRecvC2CReadReceipt,
    this.onRecvNewMessage,
    this.onRecvOfflineNewMessage,
    this.onRecvOnlineOnlyMessage,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  /// 调用消息删除回调
  void msgDeleted(Message msg) {
    onMsgDeleted?.call(msg);
  }

  /// 调用消息撤回回调
  void newRecvMessageRevoked(RevokedInfo info) {
    onNewRecvMessageRevoked?.call(info);
  }

  /// 调用 C2C 已读回执回调
  void recvC2CReadReceipt(List<ReadReceiptInfo> list) {
    onRecvC2CReadReceipt?.call(list);
  }

  /// 调用收到新消息回调
  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }

  /// 调用收到离线消息回调
  void recvOfflineNewMessage(Message msg) {
    onRecvOfflineNewMessage?.call(msg);
  }

  /// 调用收到仅在线消息回调
  void recvOnlineOnlyMessage(Message msg) {
    onRecvOnlineOnlyMessage?.call(msg);
  }
}
