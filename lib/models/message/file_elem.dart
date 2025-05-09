/// 文件消息内容
class FileElem {
  /// 文件路径
  String? filePath;

  /// 文件的唯一标识符（UUID）
  String? uuid;

  /// 文件的 URL 地址
  String? sourceUrl;

  /// 文件名
  String? fileName;

  /// 文件大小（字节）
  int? fileSize;

  /// 构造函数
  FileElem({this.filePath, this.uuid, this.sourceUrl, this.fileName, this.fileSize});

  /// 从 JSON 数据创建 FileElem 实例
  FileElem.fromJson(Map<String, dynamic> json) {
    filePath = json['filePath'];
    uuid = json['uuid'];
    sourceUrl = json['sourceUrl'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
  }

  /// 将 FileElem 实例转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['filePath'] = filePath;
    data['uuid'] = uuid;
    data['sourceUrl'] = sourceUrl;
    data['fileName'] = fileName;
    data['fileSize'] = fileSize;
    return data;
  }
}