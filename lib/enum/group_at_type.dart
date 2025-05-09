/// 会话强提示内容
class GroupAtType {
  /// 取消所有提示，相当于调用 resetConversationGroupAtType 方法
  static const atNormal = 0;

  /// @ 我的提示
  static const atMe = 1;

  /// @ 所有人的提示
  static const atAll = 2;

  /// @ 所有人和 @ 我的提示
  static const atAllAtMe = 3;

  /// 群组通知提示
  static const groupNotification = 4;
}