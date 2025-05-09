/// 群组加入验证设置
class GroupVerification {
  /// 申请加入和邀请直接入群
  static const int applyNeedVerificationInviteDirectly = 0;

  /// 所有人都需要验证，群主和管理员可以直接邀请
  static const int allNeedVerification = 1;

  /// 直接加入群组
  static const int directly = 2;
}