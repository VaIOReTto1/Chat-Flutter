/// @消息用户ID和昵称关系对象
class AtUserInfo {
  /// 被@的用户ID
  String? atUserID;

  /// 被@的用户群昵称
  String? groupNickname;

  AtUserInfo({this.atUserID, this.groupNickname});

  AtUserInfo.fromJson(Map<String, dynamic> json) {
    atUserID = json['atUserID'];
    groupNickname = json['groupNickname'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['atUserID'] = atUserID;
    data['groupNickname'] = groupNickname;
    return data;
  }
}