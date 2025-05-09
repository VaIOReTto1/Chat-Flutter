/// 用户扩展信息
class UserExInfo {
  /// 用户ID
  String? userID;

  /// 扩展字段
  String? ex;

  UserExInfo({this.userID, this.ex});

  UserExInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['ex'] = ex;
    return data;
  }
}