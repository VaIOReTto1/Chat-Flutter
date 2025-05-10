/// 群组邀请结果
class GroupInviteResult {
  String? userID;
  int? result;

  GroupInviteResult({this.userID, this.result});

  GroupInviteResult.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['result'] = result;
    return data;
  }
}