/// 好友关系信息模型类
class FriendshipInfo {
  /// 用户 ID
  String? userID;

  /// 好友关系状态：
  /// 1：是好友且不在黑名单中
  int? result;

  /// 构造函数
  FriendshipInfo({this.userID, this.result});

  /// 从 JSON 数据创建 FriendshipInfo 对象
  FriendshipInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    result = json['result'];
  }

  /// 将 FriendshipInfo 对象转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['result'] = result;
    return data;
  }
}
