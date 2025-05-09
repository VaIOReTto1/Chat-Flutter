/// 自定义消息内容
class CustomElem {
  /// 自定义数据
  String? data;

  /// 扩展内容
  String? extension;

  /// 描述
  String? description;

  CustomElem({this.data, this.extension, this.description});

  CustomElem.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    extension = json['extension'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    data['extension'] = extension;
    data['description'] = description;
    return data;
  }
}