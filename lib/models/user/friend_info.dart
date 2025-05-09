/// 好友信息模型类
class FriendInfo {
  /// 拥有者用户 ID
  String? ownerUserID;

  /// 用户 ID
  String? userID;

  /// 昵称
  String? nickname;

  /// 头像 URL
  String? faceURL;

  /// 好友用户 ID
  String? friendUserID;

  /// 备注
  String? remark;

  /// 附加信息
  String? ex;

  /// 创建时间
  int? createTime;

  /// 添加来源
  int? addSource;

  /// 操作用户 ID
  String? operatorUserID;

  /// 构造函数
  FriendInfo({
    this.ownerUserID,
    this.userID,
    this.nickname,
    this.faceURL,
    this.friendUserID,
    this.remark,
    this.ex,
    this.createTime,
    this.addSource,
    this.operatorUserID,
  });

  /// 从 JSON 数据创建 FriendInfo 对象
  FriendInfo.fromJson(Map<String, dynamic> json) {
    ownerUserID = json['ownerUserID'];
    userID = json['userID'];
    remark = json['remark'];
    createTime = json['createTime'];
    addSource = json['addSource'];
    operatorUserID = json['operatorUserID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    friendUserID = json['friendUserID'];
    ex = json['ex'];
  }

  /// 将 FriendInfo 对象转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ownerUserID'] = ownerUserID;
    data['userID'] = userID;
    data['remark'] = remark;
    data['createTime'] = createTime;
    data['addSource'] = addSource;
    data['operatorUserID'] = operatorUserID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['friendUserID'] = friendUserID;
    data['ex'] = ex;
    return data;
  }

  /// 获取显示名称，优先使用备注，其次是昵称，最后是用户 ID
  String getShowName() => _isNull(remark) ?? _isNull(nickname) ?? userID!;

  /// 判断字符串是否为空或仅包含空白字符
  static String? _isNull(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return value;
  }
}
