/// 名片消息内容
class CardElem {
  String? userID;
  String? nickname;
  String? faceURL;
  String? ex;

  CardElem({this.userID, this.nickname, this.faceURL, this.ex});

  CardElem.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    return data;
  }
}