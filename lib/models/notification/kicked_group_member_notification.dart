import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 群成员被踢出通知
class KickedGroupMemeberNotification {
  /// 群组信息
  GroupInfo? group;

  /// 操作人信息
  GroupMembersInfo? opUser;

  /// 被踢出群的用户列表
  List<GroupMembersInfo>? kickedUserList;

  KickedGroupMemeberNotification({this.group, this.opUser, this.kickedUserList});

  KickedGroupMemeberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    if (json['kickedUserList'] != null) {
      kickedUserList = <GroupMembersInfo>[];
      json['kickedUserList'].forEach((v) {
        kickedUserList!.add(GroupMembersInfo.fromJson(v));
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
    if (kickedUserList != null) {
      data['kickedUserList'] = kickedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}