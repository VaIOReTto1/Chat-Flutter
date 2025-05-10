/// 消息发送状态
class MessageStatus {
  /// 发送中
  static const sending = 1;

  /// 发送成功
  static const succeeded = 2;

  /// 发送失败
  static const failed = 3;

  /// 已删除
  static const deleted = 4;
}

enum GetHistoryViewType {
  history(0),
  search(1);

  final int rawValue;

  const GetHistoryViewType(this.rawValue);
}