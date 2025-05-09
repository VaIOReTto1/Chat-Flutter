import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 群组事件通知
class GroupNotification {
  /// 群组信息
  GroupInfo? group;

  /// 当前事件操作人信息
  GroupMembersInfo? opUser;

  /// 群主信息
  GroupMembersInfo? groupOwnerUser;

  /// 受影响的群成员列表
  List<GroupMembersInfo>? memberList;

  GroupNotification({
    this.group,
    this.opUser,
    this.groupOwnerUser,
    this.memberList,
  });

  GroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    groupOwnerUser = json['groupOwnerUser'] != null ? GroupMembersInfo.fromJson(json['groupOwnerUser']) : null;
    if (json['memberList'] != null) {
      memberList = <GroupMembersInfo>[];
      json['memberList'].forEach((v) {
        memberList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (groupOwnerUser != null) {
      data['groupOwnerUser'] = groupOwnerUser!.toJson();
    }
    if (memberList != null) {
      data['memberList'] = memberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}