import '../../models/group/group_application_info.dart';
import '../../models/message/Message.dart';
import '../../models/user/friend_appliction_info.dart';

/// 服务端监听器
class OnListenerForService {
  /// 好友申请添加回调
  Function(FriendApplicationInfo info)? onFriendApplicationAdded;

  /// 好友申请被接受回调
  Function(FriendApplicationInfo info)? onFriendApplicationAccepted;

  /// 群申请被接受回调
  Function(GroupApplicationInfo info)? onGroupApplicationAccepted;

  /// 新增群申请回调
  Function(GroupApplicationInfo info)? onGroupApplicationAdded;

  /// 收到新消息回调
  Function(Message msg)? onRecvNewMessage;

  OnListenerForService({
    this.onFriendApplicationAdded,
    this.onFriendApplicationAccepted,
    this.onGroupApplicationAccepted,
    this.onGroupApplicationAdded,
    this.onRecvNewMessage,
  });

  /// 触发好友申请被接受
  void friendApplicationAccepted(FriendApplicationInfo info) {
    onFriendApplicationAccepted?.call(info);
  }

  /// 触发好友申请添加
  void friendApplicationAdded(FriendApplicationInfo info) {
    onFriendApplicationAdded?.call(info);
  }

  /// 触发群申请被接受
  void groupApplicationAccepted(GroupApplicationInfo info) {
    onGroupApplicationAccepted?.call(info);
  }

  /// 触发新增群申请
  void groupApplicationAdded(GroupApplicationInfo info) {
    onGroupApplicationAdded?.call(info);
  }

  /// 触发收到新消息
  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }
}
