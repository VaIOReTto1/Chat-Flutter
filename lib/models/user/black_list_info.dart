/// 黑名单信息模型类
class BlacklistInfo {
  /// 用户 ID
  String? userID;

  /// 昵称
  String? nickname;

  /// 拥有者用户 ID
  String? ownerUserID;

  /// 被屏蔽用户 ID
  String? blockUserID;

  /// 头像 URL
  String? faceURL;

  /// 性别
  int? gender;

  /// 创建时间
  int? createTime;

  /// 添加来源
  int? addSource;

  /// 操作用户 ID
  String? operatorUserID;

  /// 附加信息
  String? ex;

  /// 构造函数
  BlacklistInfo({
    this.ownerUserID,
    this.blockUserID,
    this.userID,
    this.nickname,
    this.faceURL,
    this.gender,
    this.createTime,
    this.addSource,
    this.operatorUserID,
    this.ex,
  });

  /// 从 JSON 数据创建 BlacklistInfo 对象
  BlacklistInfo.fromJson(Map<String, dynamic> json) {
    ownerUserID = json['ownerUserID'];
    blockUserID = json['blockUserID'];
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    createTime = json['createTime'];
    addSource = json['addSource'];
    operatorUserID = json['operatorUserID'];
    ex = json['ex'];
  }

  /// 将 BlacklistInfo 对象转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ownerUserID'] = ownerUserID;
    data['blockUserID'] = blockUserID;
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['gender'] = gender;
    data['createTime'] = createTime;
    data['addSource'] = addSource;
    data['operatorUserID'] = operatorUserID;
    data['ex'] = ex;
    return data;
  }
}
