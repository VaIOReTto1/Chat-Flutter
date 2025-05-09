import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 用户被邀请加入群组通知
class InvitedJoinGroupNotification {
  /// 群组信息
  GroupInfo? group;

  /// 操作人信息
  GroupMembersInfo? opUser;

  /// 邀请者信息
  GroupMembersInfo? inviterUser;

  /// 被邀请的用户列表
  List<GroupMembersInfo>? invitedUserList;

  InvitedJoinGroupNotification({this.group, this.opUser, this.invitedUserList});

  InvitedJoinGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    inviterUser = json['inviterUser'] != null ? GroupMembersInfo.fromJson(json['inviterUser']) : null;
    if (json['invitedUserList'] != null) {
      invitedUserList = <GroupMembersInfo>[];
      json['invitedUserList'].forEach((v) {
        invitedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (inviterUser != null) {
      data['inviterUser'] = inviterUser!.toJson();
    }
    if (invitedUserList != null) {
      data['invitedUserList'] = invitedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}