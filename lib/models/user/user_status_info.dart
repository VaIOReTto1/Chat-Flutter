class UserStatusInfo {
  /// 用户 ID
  String? userID;

  /// 状态：
  /// 0：离线
  /// 1：在线
  int? status;

  /// 平台 ID 列表
  List<int>? platformIDs;

  UserStatusInfo({
    this.userID,
    this.status,
    this.platformIDs,
  });

  UserStatusInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    status = json['status'];
    platformIDs = json["platformIDs"] == null ? [] : List<int>.from(json["platformIDs"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['status'] = status;
    data['platformIDs'] = List<dynamic>.from(platformIDs!.map((x) => x));
    return data;
  }
}
