import '../../models/user/user_info.dart';
import '../../models/user/user_status_info.dart';

/// 当前用户资料监听器
class OnUserListener {
  /// 登录用户自身信息更新回调
  Function(UserInfo info)? onSelfInfoUpdated;

  /// 用户状态变化回调
  Function(UserStatusInfo info)? onUserStatusChanged;

  OnUserListener({
    this.onSelfInfoUpdated,
    this.onUserStatusChanged,
  });

  /// 触发自身信息更新回调
  void selfInfoUpdated(UserInfo info) {
    onSelfInfoUpdated?.call(info);
  }

  /// 触发用户状态变化回调
  void userStatusChanged(UserStatusInfo info) {
    onUserStatusChanged?.call(info);
  }
}
