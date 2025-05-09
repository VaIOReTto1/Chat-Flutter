import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 群成员禁言通知
class MuteMemberNotification {
  /// 群组信息
  GroupInfo? group;

  /// 操作人信息
  GroupMembersInfo? opUser;

  /// 被禁言的成员信息
  GroupMembersInfo? mutedUser;

  /// 禁言时长（秒）
  int? mutedSeconds;

  MuteMemberNotification({
    this.group,
    this.opUser,
    this.mutedUser,
    this.mutedSeconds,
  });

  MuteMemberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    mutedUser = json['mutedUser'] != null ? GroupMembersInfo.fromJson(json['mutedUser']) : null;
    mutedSeconds = json['mutedSeconds'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (mutedUser != null) {
      data['mutedUser'] = mutedUser!.toJson();
    }
    data['mutedSeconds'] = mutedSeconds;
    return data;
  }
}