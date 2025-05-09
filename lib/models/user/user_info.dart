/// 用户信息模型类
class UserInfo {
  /// 用户 ID
  String? userID;

  /// 用户昵称
  String? nickname;

  /// 用户头像 URL
  String? faceURL;

  /// 附加信息
  String? ex;

  /// 创建时间
  int? createTime;

  /// 备注
  String? remark;

  /// 全局消息接收设置：
  /// 0：正常接收
  /// 1：不接收消息
  /// 2：仅接收在线消息，不接收离线消息
  int? globalRecvMsgOpt;

  /// 应用管理员级别
  int? appManagerLevel;

  /// 构造函数
  UserInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.appManagerLevel,
    this.ex,
    this.createTime,
    this.remark,
    this.globalRecvMsgOpt,
  });

  /// 从 JSON 数据创建 UserInfo 对象
  UserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'] ?? userID;
    nickname = json['nickname'] ?? nickname;
    faceURL = json['faceURL'] ?? faceURL;
    remark = json['remark'] ?? remark;
    ex = json['ex'] ?? ex;
    createTime = json['createTime'];
    globalRecvMsgOpt = json['globalRecvMsgOpt'];
    appManagerLevel = json['appManagerLevel'];
  }

  /// 将 UserInfo 对象转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['appManagerLevel'] = appManagerLevel;
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    data['createTime'] = createTime;
    data['remark'] = remark;
    data['globalRecvMsgOpt'] = globalRecvMsgOpt;
    return data;
  }

  /// 获取显示名称，优先使用备注，其次是昵称，最后是用户 ID
  String getShowName() => _isNull(remark) ?? _isNull(nickname) ?? userID!;

  /// 判断字符串是否为空或仅包含空白字符
  static String? _isNull(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserInfo && runtimeType == other.runtimeType && userID == other.userID;

  @override
  int get hashCode => userID.hashCode;
}
