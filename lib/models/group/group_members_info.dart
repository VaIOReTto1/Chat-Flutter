/// 群组成员信息
class GroupMembersInfo {
  /// 群组 ID
  String? groupID;

  /// 用户 ID
  String? userID;

  /// 昵称
  String? nickname;

  /// 头像
  String? faceURL;

  /// 角色 [GroupRoleLevel]
  int? roleLevel;

  /// 加入时间
  int? joinTime;

  /// 加入来源：2 - 被邀请，3 - 搜索，4 - 扫码
  int? joinSource;

  /// 操作人 ID
  String? operatorUserID;

  /// 扩展信息
  String? ex;

  /// 静音结束时间（秒）
  int? muteEndTime;

  /// 应用管理者级别
  int? appManagerLevel;

  /// 邀请者用户 ID
  String? inviterUserID;

  GroupMembersInfo({
    this.groupID,
    this.userID,
    this.roleLevel,
    this.joinTime,
    this.nickname,
    this.faceURL,
    this.ex,
    this.joinSource,
    this.operatorUserID,
    this.muteEndTime,
    this.appManagerLevel,
    this.inviterUserID,
  });

  GroupMembersInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    userID = json['userID'];
    roleLevel = json['roleLevel'];
    joinTime = json['joinTime'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    ex = json['ex'];
    joinSource = json['joinSource'];
    operatorUserID = json['operatorUserID'];
    muteEndTime = json['muteEndTime'];
    appManagerLevel = json['appManagerLevel'];
    inviterUserID = json['inviterUserID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupID'] = groupID;
    data['userID'] = userID;
    data['roleLevel'] = roleLevel;
    data['joinTime'] = joinTime;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    data['joinSource'] = joinSource;
    data['operatorUserID'] = operatorUserID;
    data['muteEndTime'] = muteEndTime;
    data['appManagerLevel'] = appManagerLevel;
    data['inviterUserID'] = inviterUserID;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupMembersInfo &&
              runtimeType == other.runtimeType &&
              groupID == other.groupID &&
              userID == other.userID;

  @override
  int get hashCode => groupID.hashCode ^ userID.hashCode;
}