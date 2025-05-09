/// 图片信息
class PictureInfo {
  /// 图片唯一标识符
  String? uuid;

  /// 图片 MIME 类型
  String? type;

  /// 图片大小（字节）
  int? size;

  /// 图片宽度（像素）
  int? width;

  /// 图片高度（像素）
  int? height;

  /// 图片 URL 地址
  String? url;

  PictureInfo({this.uuid, this.type, this.size, this.width, this.height, this.url});

  PictureInfo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['type'] = type;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    return data;
  }
}