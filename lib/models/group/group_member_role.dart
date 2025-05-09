/// 群组成员角色
class GroupMemberRole {
  /// 用户 ID
  String? userID;

  /// [GroupRoleLevel] 1: 普通成员, 2: 群主, 3: 管理员
  int? roleLevel;

  GroupMemberRole({this.userID, this.roleLevel = 1});

  GroupMemberRole.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    roleLevel = json['roleLevel'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['roleLevel'] = roleLevel;
    return data;
  }
}