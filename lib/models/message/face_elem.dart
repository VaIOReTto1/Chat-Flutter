/// 表情消息内容
class FaceElem {
  /// 表情位置，用户自定义的嵌入式表情，用于点对点通信
  int? index;

  /// 其他表情，如 URL 表情，直接返回 URL
  String? data;

  FaceElem({this.index, this.data});

  FaceElem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['data'] = this.data;
    return data;
  }
}