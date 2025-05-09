/// 设置群成员信息
class SetGroupMemberInfo {
  /// 群组 ID
  final String groupID;

  /// 用户 ID
  final String userID;

  /// 角色等级
  final int? roleLevel;

  /// 昵称
  final String? nickname;

  /// 头像
  final String? faceURL;

  /// 扩展信息
  final String? ex;

  SetGroupMemberInfo({
    required this.groupID,
    required this.userID,
    this.roleLevel,
    this.nickname,
    this.faceURL,
    this.ex,
  });

  SetGroupMemberInfo.fromJson(Map<String, dynamic> json)
      : groupID = json['groupID'],
        userID = json['userID'],
        roleLevel = json['roleLevel'],
        nickname = json['nickname'],
        faceURL = json['faceURL'],
        ex = json['ex'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupID'] = groupID;
    data['userID'] = userID;
    data['roleLevel'] = roleLevel;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    return data;
  }

  @override
  String toString() {
    return 'SetGroupMemberInfo{groupID: $groupID, userID: $userID, roleLevel: $roleLevel, nickname: $nickname, faceURL: $faceURL, ex: $ex}';
  }
}
