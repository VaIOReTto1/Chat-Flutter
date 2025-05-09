import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 群成员信息变更通知
class GroupMemberInfoChangedNotification {
  /// 群组信息
  GroupInfo? group;

  /// 操作人信息
  GroupMembersInfo? opUser;

  /// 信息变更的成员
  GroupMembersInfo? changedUser;

  GroupMemberInfoChangedNotification({
    this.group,
    this.opUser,
    this.changedUser,
  });

  GroupMemberInfoChangedNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    changedUser = json['changedUser'] != null ? GroupMembersInfo.fromJson(json['changedUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (changedUser != null) {
      data['changedUser'] = changedUser!.toJson();
    }
    return data;
  }
}