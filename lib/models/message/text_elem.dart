/// 文本消息内容
class TextElem {
  String? content;

  TextElem({this.content});

  TextElem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    return data;
  }
}