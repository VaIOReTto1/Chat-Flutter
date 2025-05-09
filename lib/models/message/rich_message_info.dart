/// 富文本消息信息
class RichMessageInfo {
  /// 类型
  String? type;

  /// 偏移量
  int? offset;

  /// 长度
  int? length;

  /// URL
  String? url;

  /// 额外信息
  String? info;

  RichMessageInfo({
    this.type,
    this.offset,
    this.length,
    this.url,
    this.info,
  });

  RichMessageInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['offset'] = offset;
    data['length'] = length;
    data['url'] = url;
    data['info'] = info;
    return data;
  }
}