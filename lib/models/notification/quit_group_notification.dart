import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 用户退出群组通知
class QuitGroupNotification {
  /// 群组信息
  GroupInfo? group;

  /// 退出群组的成员信息
  GroupMembersInfo? quitUser;

  QuitGroupNotification({this.group, this.quitUser});

  QuitGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    quitUser = json['quitUser'] != null ? GroupMembersInfo.fromJson(json['quitUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (quitUser != null) {
      data['quitUser'] = quitUser!.toJson();
    }
    return data;
  }
}