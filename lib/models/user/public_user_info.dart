/// 公共用户信息模型类
class PublicUserInfo {
  /// 用户 ID
  String? userID;

  /// 用户昵称
  String? nickname;

  /// 用户头像 URL
  String? faceURL;

  /// 应用管理员级别：
  /// 1：普通用户
  /// 2：管理员
  int? appManagerLevel;

  /// 附加信息
  String? ex;

  /// 构造函数
  PublicUserInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.appManagerLevel,
    this.ex,
  });

  /// 从 JSON 数据创建 PublicUserInfo 对象
  PublicUserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    appManagerLevel = json['appManagerLevel'];
    ex = json['ex'];
  }

  /// 将 PublicUserInfo 对象转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['appManagerLevel'] = appManagerLevel;
    data['ex'] = ex;
    return data;
  }
}
