import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 进入群组通知
class EnterGroupNotification {
  /// 群组信息
  GroupInfo? group;

  /// 进入群组的成员信息
  GroupMembersInfo? entrantUser;

  EnterGroupNotification({this.group, this.entrantUser});

  EnterGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    entrantUser = json['entrantUser'] != null ? GroupMembersInfo.fromJson(json['entrantUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (entrantUser != null) {
      data['entrantUser'] = entrantUser!.toJson();
    }
    return data;
  }
}