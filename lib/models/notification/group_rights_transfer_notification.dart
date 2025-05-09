import '../group/group_info.dart';
import '../group/group_members_info.dart';

/// 群组权限转移通知
class GroupRightsTransferNoticication {
  /// 群组信息
  GroupInfo? group;

  /// 操作人信息
  GroupMembersInfo? opUser;

  /// 新的群主信息
  GroupMembersInfo? newGroupOwner;

  GroupRightsTransferNoticication({
    this.group,
    this.opUser,
    this.newGroupOwner,
  });

  GroupRightsTransferNoticication.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    newGroupOwner = json['newGroupOwner'] != null ? GroupMembersInfo.fromJson(json['newGroupOwner']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (newGroupOwner != null) {
      data['newGroupOwner'] = newGroupOwner!.toJson();
    }
    return data;
  }
}