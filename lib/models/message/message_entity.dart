/// 消息实体
class MessageEntity {
  /// 实体类型
  String? type;

  /// 偏移量
  int? offset;

  /// 长度
  int? length;

  /// URL 地址
  String? url;

  /// 扩展信息
  String? ex;

  MessageEntity({this.type, this.offset, this.length, this.url, this.ex});

  MessageEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['offset'] = offset;
    data['length'] = length;
    data['url'] = url;
    data['ex'] = ex;
    return data;
  }
}