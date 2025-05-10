import '../../models/group/group_application_info.dart';
import '../../models/group/group_info.dart';
import '../../models/group/group_members_info.dart';

/// 群组监听器
class OnGroupListener {
  /// 加群申请被接受回调
  Function(GroupApplicationInfo info)? onGroupApplicationAccepted;

  /// 新加群申请回调
  Function(GroupApplicationInfo info)? onGroupApplicationAdded;

  /// 加群申请被删除回调
  Function(GroupApplicationInfo info)? onGroupApplicationDeleted;

  /// 加群申请被拒绝回调
  Function(GroupApplicationInfo info)? onGroupApplicationRejected;

  /// 群组被解散回调
  Function(GroupInfo info)? onGroupDismissed;

  /// 群组信息变更回调
  Function(GroupInfo info)? onGroupInfoChanged;

  /// 群成员被添加回调
  Function(GroupMembersInfo info)? onGroupMemberAdded;

  /// 群成员被删除回调
  Function(GroupMembersInfo info)? onGroupMemberDeleted;

  /// 群成员信息变更回调
  Function(GroupMembersInfo info)? onGroupMemberInfoChanged;

  /// 已加入的群组被添加回调
  Function(GroupInfo info)? onJoinedGroupAdded;

  /// 已加入的群组被删除回调
  Function(GroupInfo info)? onJoinedGroupDeleted;

  OnGroupListener({
    this.onGroupApplicationAccepted,
    this.onGroupApplicationAdded,
    this.onGroupApplicationDeleted,
    this.onGroupApplicationRejected,
    this.onGroupDismissed,
    this.onGroupInfoChanged,
    this.onGroupMemberAdded,
    this.onGroupMemberDeleted,
    this.onGroupMemberInfoChanged,
    this.onJoinedGroupAdded,
    this.onJoinedGroupDeleted,
  });

  /// 触发“加群申请被接受”回调
  void groupApplicationAccepted(GroupApplicationInfo info) {
    onGroupApplicationAccepted?.call(info);
  }

  /// 触发“新加群申请”回调
  void groupApplicationAdded(GroupApplicationInfo info) {
    onGroupApplicationAdded?.call(info);
  }

  /// 触发“加群申请被删除”回调
  void groupApplicationDeleted(GroupApplicationInfo info) {
    onGroupApplicationDeleted?.call(info);
  }

  /// 触发“加群申请被拒绝”回调
  void groupApplicationRejected(GroupApplicationInfo info) {
    onGroupApplicationRejected?.call(info);
  }

  /// 触发“群组被解散”回调
  void groupDismissed(GroupInfo info) {
    onGroupDismissed?.call(info);
  }

  /// 触发“群组信息变更”回调
  void groupInfoChanged(GroupInfo info) {
    onGroupInfoChanged?.call(info);
  }

  /// 触发“群成员被添加”回调
  void groupMemberAdded(GroupMembersInfo info) {
    onGroupMemberAdded?.call(info);
  }

  /// 触发“群成员被删除”回调
  void groupMemberDeleted(GroupMembersInfo info) {
    onGroupMemberDeleted?.call(info);
  }

  /// 触发“群成员信息变更”回调
  void groupMemberInfoChanged(GroupMembersInfo info) {
    onGroupMemberInfoChanged?.call(info);
  }

  /// 触发“已加入的群组被添加”回调
  void joinedGroupAdded(GroupInfo info) {
    onJoinedGroupAdded?.call(info);
  }

  /// 触发“已加入的群组被删除”回调
  void joinedGroupDeleted(GroupInfo info) {
    onJoinedGroupDeleted?.call(info);
  }
}
