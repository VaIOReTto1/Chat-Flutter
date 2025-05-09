/// 正在输入提示消息内容
class TypingElem {
  String? msgTips;

  TypingElem({this.msgTips});

  TypingElem.fromJson(Map<String, dynamic> json) {
    msgTips = json['msgTips'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msgTips'] = msgTips;
    return data;
  }
}