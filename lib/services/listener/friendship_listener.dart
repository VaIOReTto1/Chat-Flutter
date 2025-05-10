import '../../models/user/black_list_info.dart';
import '../../models/user/friend_appliction_info.dart';
import '../../models/user/friend_info.dart';

/// 好友关系监听器
class OnFriendshipListener {
  /// 添加到黑名单回调
  Function(BlacklistInfo info)? onBlackAdded;

  /// 从黑名单删除回调
  Function(BlacklistInfo info)? onBlackDeleted;

  /// 好友添加回调
  Function(FriendInfo info)? onFriendAdded;

  /// 好友申请被接受回调
  Function(FriendApplicationInfo info)? onFriendApplicationAccepted;

  /// 新的好友申请添加回调
  Function(FriendApplicationInfo info)? onFriendApplicationAdded;

  /// 好友申请删除回调
  Function(FriendApplicationInfo info)? onFriendApplicationDeleted;

  /// 好友申请被拒绝回调
  Function(FriendApplicationInfo info)? onFriendApplicationRejected;

  /// 好友删除回调
  Function(FriendInfo info)? onFriendDeleted;

  /// 好友信息变更回调
  Function(FriendInfo info)? onFriendInfoChanged;

  OnFriendshipListener({
    this.onBlackAdded,
    this.onBlackDeleted,
    this.onFriendAdded,
    this.onFriendApplicationAccepted,
    this.onFriendApplicationAdded,
    this.onFriendApplicationDeleted,
    this.onFriendApplicationRejected,
    this.onFriendDeleted,
    this.onFriendInfoChanged,
  });

  /// 触发添加到黑名单回调
  void blackAdded(BlacklistInfo info) {
    onBlackAdded?.call(info);
  }

  /// 触发从黑名单删除回调
  void blackDeleted(BlacklistInfo info) {
    onBlackDeleted?.call(info);
  }

  /// 触发好友添加回调
  void friendAdded(FriendInfo info) {
    onFriendAdded?.call(info);
  }

  /// 触发好友申请被接受回调
  void friendApplicationAccepted(FriendApplicationInfo info) {
    onFriendApplicationAccepted?.call(info);
  }

  /// 触发新的好友申请添加回调
  void friendApplicationAdded(FriendApplicationInfo info) {
    onFriendApplicationAdded?.call(info);
  }

  /// 触发好友申请删除回调
  void friendApplicationDeleted(FriendApplicationInfo info) {
    onFriendApplicationDeleted?.call(info);
  }

  /// 触发好友申请被拒绝回调
  void friendApplicationRejected(FriendApplicationInfo info) {
    onFriendApplicationRejected?.call(info);
  }

  /// 触发好友删除回调
  void friendDeleted(FriendInfo info) {
    onFriendDeleted?.call(info);
  }

  /// 触发好友信息变更回调
  void friendInfoChanged(FriendInfo info) {
    onFriendInfoChanged?.call(info);
  }
}
